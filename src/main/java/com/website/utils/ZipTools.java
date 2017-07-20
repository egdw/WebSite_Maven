package com.website.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

public class ZipTools {

	/**
	 * 压缩文件
	 * 
	 * @param zipFileName
	 *            保存的压缩包文件路径
	 * @param inputFile
	 *            需要压缩的文件夹或者文件路径
	 * @throws Exception
	 */
	public void compress(String zipFileName, String filePath, boolean isDelete)
			throws Exception {
		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(
				zipFileName));
		File inputFile = new File(filePath);

		if (!inputFile.exists()) {
			System.err.println("在指定路径未找到需要压缩的文件！");
		}
		compress(out, inputFile, "", isDelete);
		System.out.println("---------------Zip Done-------------");
		out.close();
	}

	/**
	 * @param out
	 *            压缩包输出流
	 * @param f
	 *            需要压缩的文件
	 * @param base
	 *            压缩相对路径路径
	 * @throws Exception
	 */
	private void compress(ZipOutputStream out, File f, String base,
			boolean isDelete) throws Exception {

		System.out.println("Zipping : " + f.getPath()); // 记录日志，开始压缩
		if (f.isDirectory()) { // 如果是文件夹，则获取下面的所有文件
			File[] fl = f.listFiles();
			out.putNextEntry(new ZipEntry(base + "/"));
			base = base.length() == 0 ? "" : base + "/";
			for (int i = 0; i < fl.length; i++) {
				compress(out, fl[i], base + fl[i].getName(), isDelete);
			}
		} else { // 如果是文件，则压缩
			out.putNextEntry(new ZipEntry(base)); // 生成下一个压缩节点
			FileInputStream in = new FileInputStream(f); // 读取文件内容
			int b;
			while ((b = in.read()) != -1) {
				out.write(b); // 写入到压缩包
			}
			in.close();
		}
		if (isDelete) {
			f.delete();
		}
	}

	/**
	 * 解压缩方法
	 * @param zipFilePath  压缩文件所在的路径，绝对文件路径
	 * @param fileSavePath  解压后存储路径
	 * @param isDelete  解压完成后是否删除压缩包
	 * @throws Exception
	 */
	public void decompress(String zipFilePath, String fileSavePath, boolean isDelete)
			throws Exception {

		if (!fileSavePath.endsWith("//")) {
			fileSavePath += "//";
		}

		File file = new File(zipFilePath);
		File savePath = new File(fileSavePath);

		// 验证待解压文件是否存在
		if (!file.exists()) {
			throw new FileNotFoundException("在指定路径未找到ZIP压缩文件！");
		}

		// 创建解压缩目录
		if (!savePath.exists()) {
			savePath.mkdirs();
		}

		ZipInputStream zis = new ZipInputStream(new FileInputStream(file));
		FileOutputStream fos = null;
		ZipEntry entry = null;
		int b;

		while ((entry = zis.getNextEntry()) != null) {
			file = new File(fileSavePath + entry.getName());
			if (entry.isDirectory()) {
				// 目录
				file.mkdirs();
			} else {
				// 文件
				fos = new FileOutputStream(file);
				while ((b = zis.read()) != -1) {
					fos.write(b);
				}
				fos.close();
			}
		}

		zis.close();
		if (isDelete) {
			new File(zipFilePath).delete();
		}
	}

}