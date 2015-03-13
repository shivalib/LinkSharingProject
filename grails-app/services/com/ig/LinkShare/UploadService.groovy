package com.ig.LinkShare

import grails.transaction.Transactional

@Transactional
class UploadService {

    def uploadImage(User user,def imageFile,String imgPath){
        Boolean flag=false
        if(!imageFile.isEmpty()) {
            flag=true
            File file = new File(imgPath + imageFile.originalFilename)
            imageFile.transferTo(file)
            return file.path
        }
    }

    DocumentResource uploadDocument(DocumentResource documentResource,def documentFile,String docPath){
        Boolean flag=false
        if(!documentFile.isEmpty()){
            flag=true
            documentResource.fileName=documentFile.originalFilename
            documentResource.filePath=docPath+documentFile.originalFilename
            File file=new File(docPath+documentFile.originalFilename)
            documentFile.transferTo(file)
            return documentResource
        }
    }
}
