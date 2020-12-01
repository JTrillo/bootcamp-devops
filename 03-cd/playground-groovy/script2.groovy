abstract class User {
    String name;
    String last;

    public String UserName() {
        return getUserName(this.name, this.last);
    }

    private String getUserName(String name, String last) {
        return name.substring(0, 1).toLowerCase() + last.toLowerCase();
    }
}

class Chef extends User {
    public String[] dishes;
}

class Baker extends User {
    public void bake() {
        println "Dessert ready"
    }
}

User[] users = [
    new Baker(name: "Ferra", last: "Adria"),
    new Chef(name: "Dani", last: "Garcia"),
]

users.each {
    u ->
    if(u instanceof Chef) {
        u.dishes.each{d -> println d}
    } else {
        u.bake();
    }
}