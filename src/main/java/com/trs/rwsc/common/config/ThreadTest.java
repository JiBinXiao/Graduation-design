package com.trs.rwsc.common.config;

/**
 * @author msy
 * @Title: ${file_name}
 * @Package ${package_name}
 * @Description: ${todo}
 * @date 2018/3/2215:25
 */
public class ThreadTest extends Thread {
    private String name;
    public ThreadTest(String name) {
        this.name = name;
    }
    @Override
    public void run() {
        for (int i = 0; i < 5; i++) {
            System.out.println(name + "运行：" + i);
            try {
                sleep((int) Math.random() * 10);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
        super.run();
    }


    public static void main(String[] args) {
        ThreadTest test = new ThreadTest("A");
        ThreadTest test2 = new ThreadTest("B");

        test.start();
        test2.start();
    }
}
