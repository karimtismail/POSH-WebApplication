package com.posh.utils.enums;

public enum CategotyEnum {
    OIL("oil",1),
    LIQUID("liquid",2),
    PLUG("plug",3),
    BATTERY("battery",4),
    TIER("tire",5),
    ALL("all", -1);
    private final int id;
    private final String name;

    CategotyEnum(String name,int id) {
        this.id = id;
        this.name = name;

    }
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
