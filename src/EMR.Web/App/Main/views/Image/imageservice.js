(function () {
    angular.module("app")
    .factory("ImageService", ["abp.services.app.image", "azureBlob", function (imageservice, azureBlob) {
        var documentCategoryList = [];
        var documentTypeList = [];
        var factory = {
            getDocumentCategoryCode: function () {
                imageservice.getDocumentCategoryCode().success(function (result) {
                    for (var i = 0; i < result.length; i++) {
                        documentCategoryList.push(result[i]);
                    }
                });
            },
            getDocumentCategoryCodeData: function () {
                if (documentCategoryList.length === 0)
                    factory.getDocumentCategoryCode();
                return documentCategoryList;
            },
            getDocumentTypeCode: function () {
                imageservice.getDocumentTypeCode().success(function (result) {
                    for (var i = 0; i < result.length; i++) {
                        documentTypeList.push(result[i]);
                    }
                });
            },
            getDocumentTypeCodeData: function () {
                if (documentTypeList.length === 0)
                    factory.getDocumentTypeCode();
                return documentTypeList;
            },
            getSASToken: function (extension, size) {
                return imageservice.getUploadDetails({
                    extension: extension,
                    fileSize: size
                });
            },
            getImageUri: function (fileName) {
                return imageservice.getImageUri({
                    fileName: fileName
                });
            },
            getImageUris: function (docRequest) {
                return imageservice.getImageUris(
                    docRequest
                );
            },
            postItem: function (item) {
                return imageservice.postUploadDetails(item);
            },
            uploadConfig: function (document, results) {
                return {
                    baseUrl: results.blobUrl,
                    sasToken: results.blobSASToken,
                    file: document.uploadfile,
                    blockSize: 1024 * 32,

                    progress: function (amount) {
                        document.progress = amount;
                    },
                    complete: function () {
                        document.progress = 90.99;
                        factory.postItem(
                            {
                                'Id': results.id,
                                'Pid': document.pid,
                                'ServerFileName': results.serverFileName,
                                'StorageAccountName': results.storageAccountName,
                                'RefrenceTableName': document.refrenceTableName,
                                'DocumentDescription': document.documentDescription,
                                'Note': document.note,
                                'DocumentCategoryCodeId': document.documentCategoryCodeId,
                                'DocumentTypeCodeId': document.documentTypeCodeId,
                                'RefrenceTableId': document.refrenceTableId,
                                'BlobUrl': results.blobUrl
                            }).success(function () {
                                document.progress = 100.00;
                                document.uploadComplete = true;
                            }).error(function (err) {
                                document.error = err;
                                document.uploadComplete = false;
                            });
                    },
                    error: function (data, status, err, config) {
                        document.error = data;
                    }
                };
            },
            validateFileSize: function (document) {
                document.error = "";
                if (!document.uploadfile) return false;
                return true;
            },
            uploadDocInfo: function (src) {
                return {
                    pid: 0,
                    progress: 0,
                    error: "",
                    uploadComplete: false,
                    uploadConfig: null,
                    uploadfile: null,
                    refrenceTableId: 0,
                    refrenceTableName: src,
                    sasToken: "",
                    documentDescription: "",
                    note: "",
                    documentCategoryCodeId: "",
                    documentTypeCodeId: "",
                    documentTypeCodeData: factory.getDocumentTypeCodeData(),
                    documentCategoryCodeData: factory.getDocumentCategoryCodeData()
                };
            },
            uploadDocuments: function (documents) {
                _.each(documents,
                    function (document) {
                        if (!factory.validateFileSize(document)) return;
                        var extension = document.uploadfile.name.split(".").pop();
                        factory.getSASToken(extension, document.uploadfile.size).success(function (results) {
                            document.config = factory.uploadConfig(document, results);
                            azureBlob.upload(document.config);
                        }).error(function (err) {
                            document.error = err;
                        });
                    });
            },
            uploadCompleteUploadDocs: function (documents) {
                var index = 0;
                while (index > -1) {
                    index = _.findIndex(documents, function (document)
                    { return document.uploadComplete === true });
                    if (index > -1) {
                        documents.splice(index, 1);
                    }
                }
            },
            removeNullUploadDocs: function (documents) {
                var index = 0;
                while (index > -1) {
                    index = _.findIndex(documents, function (document)
                    { return document.uploadfile === null });
                    if (index > -1) {
                        documents.splice(index, 1);
                    }
                }
            }
        }
        return factory;

    }]);

    angular.module("app").controller("app.views.image.view", [
             "$scope", "ImageService", "$stateParams", "$uibModalInstance", "param",

         function ($scope, imageService, $stateParams, $uibModalInstance, param) {
             var vm = this;
             abp.ui.setBusy();
             vm.images = [];
             vm.documentCategoryCodeData = imageService.getDocumentCategoryCodeData();
             vm.documentTypeCodeData = imageService.getDocumentTypeCodeData();
             imageService.getImageUris(param.docRequest)
                  .success(function (result) {
                      if (result.length === 0) {
                          $uibModalInstance.dismiss();
                          abp.notify.warn(App.localize("NoImagesFound"));
                      }
                      for (var i = 0; i < result.length; i++) {
                          var category = _.find(vm.documentCategoryCodeData,
                              function (item) {
                                  return item.documentCategoryCodeId === result[i].documentCategoryCodeId;
                              });
                          result[i].documentCategoryCodeName = category ? category.documentCategoryCodeName : "";

                          var type = _.find(vm.documentTypeCodeData,
                                     function (item) {
                                         return item.documentTypeCodeId === result[i].documentTypeCodeId;
                                     });
                          result[i].documentTypeCodeName = type ? type.documentTypeCodeName : "";

                          if (result[i].documentDescription === "") {
                              result[i].documentDescription = result[i].extension;
                          }
                          vm.images.push(result[i]);

                      }
                  }).finally(function () {
                      abp.ui.clearBusy();
                  });
             vm.close = function () {
                 $uibModalInstance.dismiss();
             };
         }
    ]);
})();
