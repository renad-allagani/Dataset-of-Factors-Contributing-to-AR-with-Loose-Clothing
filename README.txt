This is the supplementary material for the Proceeding Paper "Analysing the contributing Factors to Activity Recognition with Loose Clothing" - Renad Allagani, Tianchen Shen, and Matthew Howard. 

1_ScotchYoke3D Folder consists of the CAD file for the scotch yoke design. 

2_ArduinoCodes Folder consists the Arduino Codes for controlling and monitoring the speed of the scotch yoke. 

3_KUKAManipulatorCode Folder consists of the JAVA code that controls the periodic motion of the KUKA manipulator. 

4_DataCollection_ClassificationCode_Plots Folder consists of dataset collected with the scotch yoke and KUKA manipulator, in addition to the SVM frequency classification MATLAB scripts, and results.  

The following key folders and files are in path: 4_DataCollection_ClassificationCode_Plots/libsvm-3.31/matlab   

Raw Data Collection Folders: 
DataCollection_ScotchYoke
DataCollection_RobotArm

Workspaces Folders: 
Workspaces_ScotchYoke
Workspaces_RobotArm
Workspaces_RobotArm_Plane

Classification Scripts: 
freqClass_ScotchYoke.m
freqClass_RobotArm.m
planeClass_RobotArm.m

Results reported in the Thesis Report: 
plot_RobotArtm_results.m
plot_ScotchYoke_results.m

Results reported in the Proceeding Paper: 
plot_ProceedingPaper_results.m

Other Plots Scripts: 
plots_ScotchYoke.m
plots_RobotArm.m
plots_RobotArm_plane.m

Abstract: 
The integration of sensors into garments has paved the way for human activity recognition (AR), enabling users to engage in extended human motion recordings. The inherent fluidity of loose clothing allows it to mirror the wearer’s movements. From a statistical standpoint, clothing captures additional valuable insights beyond the rigid body motion improving AR. This work demonstrates how fabric’s orientation, layering and width contribute to the enhanced performance of AR with clothing in periodic motion. Experiments are reported in which a scotch yoke and a KUKA robot manipulator are used to induce periodic motion of fabric cloth at different frequencies. These reveal that clothing-attached sensors exhibit higher frequency classification accuracy among sensors with an improvement of 27% for perpendicular-oriented fabric, 18% for triple-layered fabric, and 9% for large-width fabric, exceeding that seen with rigid-attached sensors. 


