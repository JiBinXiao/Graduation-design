package com.trs.rwsc.common.config;

/**
 * @author msy
 * @Title: ${file_name}
 * @Package ${package_name}
 * @Description: ${todo}
 * @date 2018/3/2215:09
 */
public class Threaad {
    public static void main(String[] args) {
        Thread2 thread2 = new Thread2();
        Thread1 thread1 = new Thread1();
        thread2.start();
        thread1.start();
    }
}
