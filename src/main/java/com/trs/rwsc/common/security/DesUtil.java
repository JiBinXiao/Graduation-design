package com.trs.rwsc.common.security;

import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CharsetEncoder;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * DES加密介绍 DES是一种对称加密算法，所谓对称加密算法即：加密和解密使用相同密钥的算法。DES加密算法出自IBM的研究，
 * 后来被美国政府正式采用，之后开始广泛流传，但是近些年使用越来越少，因为DES使用56位密钥，以现代计算能力，
 * 24小时内即可被破解。虽然如此，在某些简单应用中，我们还是可以使用DES加密算法，本文简单讲解DES的JAVA实现 。
 * 注意：DES加密和解密过程中，密钥长度都必须是8的倍数
 */
public class DesUtil {
	// private static byte[] keys = { 1, -1, 1, -1, 1, -1, 1, -1 };

	private static String key = "20160202";

	// public static String getKey() {
	// return key;
	// }
	//
	// public static void setKey(String key) {
	// DesUtil.key = key;
	// }

	/**
	 * 
	 * <p>
	 * 对password进行MD5加密
	 * 
	 * @param source
	 * @return
	 * @return byte[] author: Heweipo
	 */
	public static byte[] getMD5(byte[] source) {
		byte tmp[] = null;
		try {
			java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
			md.update(source);
			tmp = md.digest();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tmp;
	}

	/**
	 * 
	 * <p>
	 * 采用JDK内置类进行真正的加密操作
	 * 
	 * @param byteS
	 * @param password
	 * @return
	 * @return byte[] author: Heweipo
	 */
	public static byte[] encryptByte(String text) {
		byte[] byteFina = null;
		try {// 初始化加密/解密工具
			 
			byte[] byteS = text.getBytes(Charset.forName("UTF-8"));
			byte[] base = key.getBytes(Charset.forName("US-ASCII"));
			//Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
			Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
			DESKeySpec desKeySpec = new DESKeySpec(base);

			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
			
			IvParameterSpec iv = new IvParameterSpec(base);
			
			cipher.init(Cipher.ENCRYPT_MODE, secretKey, iv);
			
			byteFina = cipher.doFinal(byteS);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return byteFina;
	}

	/**
	 * 
	 * <p>
	 * 采用JDK对应的内置类进行解密操作
	 * 
	 * @param byteS
	 * @param password
	 * @return
	 * @return byte[] author: Heweipo
	 */
	private static byte[] decryptByte(byte[] byteS, byte password[]) {
		byte[] byteFina = null;
		try {// 初始化加密/解密工具
			byte[] base = key.getBytes(Charset.forName("US-ASCII"));
			Cipher cipher = Cipher.getInstance("DES/CBC/PKCS5Padding");
			DESKeySpec desKeySpec = new DESKeySpec(base);
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			SecretKey secretKey = keyFactory.generateSecret(desKeySpec);
			
			IvParameterSpec iv = new IvParameterSpec(base);
			cipher.init(Cipher.DECRYPT_MODE, secretKey, iv);
			byteFina = cipher.doFinal(byteS);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return byteFina;
	}

	

	/**
	 * 
	 * <p>
	 * Base64转换strMi,然后进行des解密
	 * 
	 * @param strMi
	 * @param md5key
	 * @return
	 * @return String author: Heweipo
	 */
	public static String decryptStr(String strMi, byte md5key[]) {
		byte[] byteMing = null;
		String strMing = "";
		try {
			BASE64Decoder decoder = new BASE64Decoder();
			byteMing = decoder.decodeBuffer(strMi);
			byteMing = decryptByte(byteMing, md5key);
			strMing = new String(byteMing);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			byteMing = null;
		}
		return strMing;
	}
	 

	public static void main(String[] args) {

		String key = "20160202";

		String data = "{\"IP\":\"192.168.8.100\",\"Port\":\"3827\",\"DBBrand\":\"MySQL\",\"DBName\":\"stationdb\",\"UserName\":\"robot\",\"PassWord\":\"robot\"}";
		try {
			//System.out.println(DesUtil.encryptStr(data, DesUtil.getMD5(key.getBytes("utf-8"))));
			System.out.println("--------------");
			byte[] lll= encryptByte(data);
			// System.out.println(DesUtil.decryptStr(DesUtil.encryptStr(data,
			// DesUtil.getMD5(key.getBytes("utf-8"))),
			// DesUtil.getMD5(key.getBytes("utf-8"))));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}



 