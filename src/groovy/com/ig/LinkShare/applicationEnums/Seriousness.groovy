package com.ig.LinkShare.applicationEnums
/**
 * Created by intelligrape on 24/2/15.
 */

//todo remove the created by statements
//todo rename and refactor the directory structure
public enum Seriousness {
SERIOUS("serious"),
VERYSERIOUS("verySerious"),
CASUAL("casual")

    String seriousness

    Seriousness(String s)
    {
        this.seriousness=s

    }
}