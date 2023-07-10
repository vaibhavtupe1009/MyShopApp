
package com.AradhanaMilkAndBekary.Helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Hepler {
    
    public static boolean deleteImg(String path){
        boolean f= false;
        try {
            File file = new File(path);
            file.delete();
            f=true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    public static boolean saveImg(InputStream is, String path){
        boolean f=false;
        try {
            byte b[] = new byte[is.available()];
            is.read(b);
            FileOutputStream fos = new FileOutputStream(path);
            System.out.println(path);
            fos.write(b);
            fos.flush();
            fos.close();
            f=true;
                
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
}
