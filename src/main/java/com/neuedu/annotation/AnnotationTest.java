package com.neuedu.annotation;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class AnnotationTest {

    public static void main(String[] args) {
        try {
            Class c = Class.forName("com.neuedu.pojo.UserInfo");
            //判断雷伤是否有Table注解
            boolean isexistsTableAnnotation = c.isAnnotationPresent(Table.class);
            if (isexistsTableAnnotation){
                //获取Table实例
                Table table = (Table) c.getAnnotation(Table.class);
                System.out.println(table.value());
                Field[] fields = c.getDeclaredFields();
                for (Field field:fields){
                    boolean isexistsColumnAnnotation = field.isAnnotationPresent(Column.class);
                    if (isexistsColumnAnnotation){
                        Column annotation = field.getAnnotation(Column.class);
                        System.out.println(annotation.value());
                    }
                }
                /*Method method = c.getMethod("get"+);
                method.invoke();*/
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
