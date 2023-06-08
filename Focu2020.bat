cd \eclipse\workspace\a

echo 'q0'>times.txt
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp >>times.txt 
C:/eclipse/plugins/CD++Builder_1.1.0/internal/simuOrig.exe -mFocu2020.ma -t00:00:00:700 -llog.log
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp times.txt

echo 'q1'>times.txt
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp >>times.txt 
C:/eclipse/plugins/CD++Builder_1.1.0/internal/simuOrig.exe -mFocu2020.ma -t00:00:00:700 -llogq1.log -q1
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp times.txt

echo 'q10' >>times.txt
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp  >>times.txt 
C:/eclipse/plugins/CD++Builder_1.1.0/internal/simuOrig.exe -mFocu2020.ma -t00:00:00:700 -llogq10.log -q10
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp  >>times.txt 

echo 'q100' >>times.txt
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp  >>times.txt 
C:/eclipse/plugins/CD++Builder_1.1.0/internal/simuOrig.exe -mFocu2020.ma -t00:00:00:700 -llogq100.log -q100
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp  >>times.txt 

echo 'Init' >>times.txt
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp  >>times.txt 
C:/eclipse/plugins/CD++Builder_1.1.0/internal/simuOrig.exe -mFocu2020.ma -t00:00:00:000	
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp  >>times.txt 

echo 'Nuevo2sec' >>times.txt
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp  >>times.txt 
C:/eclipse/plugins/CD++Builder_1.1.0/internal/simuOrig.exe -mFocu2020.ma -t00:00:02:000	
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp  >>times.txt 

echo 'Nuevo2secLog' >>times.txt
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp  >>times.txt 
C:/eclipse/plugins/CD++Builder_1.1.0/internal/simuOrig.exe -mFocu2020.ma -t00:00:02:000 -llog2sec.log	
C:/eclipse/plugins/CD++Builder_1.1.0/internal/stamp  >>times.txt 

