String name = "Joe Doe";
int courseCount = 14;
BigDecimal salary = 999999.99;
Boolean isProgrammer = true;

// println name + " has created " + courseCount + " courses";
/*println name + " is programmer? " + isProgrammer.toString().capitalize();
println name + " wishes his salary was \$" + String.format("%.2f", salary);*/

if (isProgrammer) {
    println "He's programmer"
} else {
    println "He's not"
}

/*for (int i = 0; i < courseCount; i++) {
    println name + " has done " + (i+1) + "!!!!!!!!"
}*/

/*while (i < courseCount) {
    i++
}*/

String[] cookers = ["Ferran", "Dani"];

for(String cooker: cookers) {
    println cooker
}

/// cookers.each{c -> println(c)} === cookers.each{println it}
