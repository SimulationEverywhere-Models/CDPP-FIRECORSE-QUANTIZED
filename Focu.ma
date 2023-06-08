#include(rules.inc)

[top]
components : ForestFire

[ForestFire]
type : cell
dim : (60,60,2)
delay : transport
defaultDelayTime : 1000
border : nowrapped
neighbors : ForestFire(-1,0,0) ForestFire(0,-1,0) ForestFire(1,0,0) 
neighbors : ForestFire(0,1,0)  ForestFire(0,0,0)  ForestFire(0,0,-1) ForestFire(0,0,1) 
initialValue : 300.0
initialCellsValue : init.val
zone : cst { (0,0,0)..(0,59,0) }  
zone : cst { (1,59,0)..(59,59,0) }
zone : cst { (59,0,0)..(59,58,0) } 
zone : cst { (1,0,0)..(58,0,0) }
localTransition : FireBehavior

[cst]
%Undefined border cells
rule : {(0,0,0)} 1 {undefCount >= 1}
rule : {(0,0,0)} 1 {t}

[FireBehavior]
%Unburned
rule : { #macro(unburned) } 1 { cellpos(2) = 0 and ( #macro(unburned) > (0,0,0) OR time <= 20 ) AND (0,0,0) < 573 AND (0,0,0) != 209 }

%ti
rule : { time * 0.01 } 1 { cellpos(2) = 1 AND (0,0,-1) >= 573 AND (0,0,0) = 1.0 }

%Burning
rule : { #macro(burning) } 1 { cellpos(2) = 0 AND ( ( (0,0,0) > #macro(burning) AND (0,0,0) > 333) OR (#macro(burning) > (0,0,0) AND (0,0,0) >= 573) )AND (0,0,0) != 209 }

%Burned
rule : { 209 } 100 { cellpos(2) = 0 AND (0,0,0) > #macro(burning) AND (0,0,0) <= 333 AND (0,0,0) != 209 }

%Stay Burned or constant
rule : {(0,0,0)} 1 {t}
