package com.ig.LinkShare.applicationEnums

public enum Seriousness {
    SERIOUS("serious"),
    VERYSERIOUS("verySerious"),
    CASUAL("casual")

    String seriousness

    Seriousness(String s) {
        this.seriousness = s
    }
}