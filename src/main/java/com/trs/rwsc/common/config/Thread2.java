package com.trs.rwsc.common.config;

/**
 * @author msy
 * @Title: ${file_name}
 * @Package ${package_name}
 * @Description: ${todo}
 * @date 2018/3/2215:17
 */
public class Thread2 extends  Thread {
    private int product = 0;
    public static final int MAX_PRODUCT = 20;
    public static final int MIN_PRODUCT = 2;
    public Thread2(){

    }

    public void run() {
        produce();
    }

    /**
     * 生产者生产出来的产品交给店员
     */
    public synchronized void produce() {
        if(this.product >= MAX_PRODUCT)
        {
            try
            {
                wait();
                System.out.println("产品已满,请稍候再生产");
            }
            catch(InterruptedException e)
            {
                e.printStackTrace();
            }
            return;
        }

        this.product++;
        System.out.println("生产者生产第" + this.product + "个产品.");
        notifyAll();   //通知等待区的消费者可以取出产品了
    }
}
