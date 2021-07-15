package ch13;

import java.io.*;
import java.util.*;

public class FileCopyThread {
	public static void main(String[] args) {
		
		System.out.println("복사할 파일의 이름을 입력해주세요.");
		Scanner sc = new Scanner(System.in);
		File originFile = new File("C:\\javafolder\\" + sc.nextLine() + ".txt");
		
		System.out.println("복사될 파일의 이름을 입력해주세요.");
		File copyFile = new File("C:\\javafolder\\" + sc.nextLine() + ".txt");
		
		CopyThread ct = new CopyThread(originFile, copyFile);
        ct.start();
	}
}

class CopyThread extends Thread{
    File originFile;
    File copyFile;

    public CopyThread(File originFile, File copyFile) {
        this.originFile = originFile;
        this.copyFile = copyFile;
    }

    @Override
    public void run() {
        try {
            InputStream in = new FileInputStream(originFile);
            OutputStream out = new FileOutputStream(copyFile);

            BufferedInputStream fin = new BufferedInputStream(in);
            BufferedOutputStream fout = new BufferedOutputStream(out);

            int copyByte=0;
            int bData =-1;
            
            while(true)
            {
                bData=fin.read();
                
                if(bData==-1) {
                    break;
                }
                
                fout.write(bData);
                copyByte++;
            }
            
            fin.close();
            fout.close();
            
            System.out.println("복사 완료 / 복사된 바이트 사이즈 "+ copyByte + "byte");
        
        }catch (FileNotFoundException e){
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
