package com.posh.utils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.util.Collection;
import java.util.List;

public class ObjectsToJsonConverter<T>
{
    private static String json;

    public static String ObjectsToJsonConverter(Object object) {
        Gson gson = new Gson();
        json = gson.toJson(object);
        return json;
    }

    public static String ListToJson(List<Object> list){
        Gson gson = new Gson();
        json = gson.toJson(list);
        return json;
    }

    public void printJson(){
        System.out.println(json);
    }

    public String getJson() {
        return json;
    }
}
