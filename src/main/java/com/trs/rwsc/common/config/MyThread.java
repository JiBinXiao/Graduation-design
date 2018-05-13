package com.trs.rwsc.common.config;

/**
 * @author msy
 * @Title: ${file_name}
 * @Package ${package_name}
 * @Description: ${todo}
 * @date 2018/3/2215:33
 */
public class MyThread implements Runnable {
    private String name;
    public MyThread(String name) {
        this.name = name;
    }
    @Override
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(name + "运行：" + i);
            try {
                Thread.sleep((int)Math.random()*100);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        System.out.println("这是要执行的其他代码@@@@@@@@@@@@@@@@@@");
        new Thread(new MyThread("A")).start();
        new Thread(new MyThread("B")).start();
        System.out.println("主线程执行结束");
    }
}
