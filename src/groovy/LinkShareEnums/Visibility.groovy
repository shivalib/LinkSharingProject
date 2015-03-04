package LinkShareEnums

/**
 * Created by intelligrape on 4/3/15.
 */
enum Visibility {
    PUBLIC("public"),
    PRIVATE("private")

    String visibility

    Visibility(String s)
    {
        this.visibility=s
    }
}