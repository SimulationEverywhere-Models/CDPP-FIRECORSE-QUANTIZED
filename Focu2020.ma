#include(rules.inc)

[top]
components : ForestFire

[ForestFire]
type : cell
dim : (20,20,2)
delay : transport
defaultDelayTime : 1
border : nowrapped
neighbors : ForestFire(-1,0,0) ForestFire(0,-1,0) ForestFire(1,0,0) ForestFire(0,0,2) 
neighbors : ForestFire(0,1,0)  ForestFire(0,0,0)  ForestFire(0,0,-1) ForestFire(0,0,1) 
initialValue : 300.0
initialCellsValue : init.val
zone : cst { (0,0,0)..(0,19,0) }  
zone : cst { (1,19,0)..(19,19,0) }
zone : cst { (19,0,0)..(19,18,0) } 
zone : cst { (1,0,0)..(18,0,0) }
zone : ti { (0,0,1)..(19,19,1) }
%zone : wakeup { (0,0,2)..(19,19,2) }
localTransition : FireBehavior


[cst]
%Constant border cells
rule : { (0,0,0) } 1 { t }

[ti]
rule : { time * 0.01 } 1 { (0,0,0) = 1.0 AND (0,0,-1) >= 573  }
rule : { (0,0,0) } 1 { t }

[FireBehavior]
%low temperature
%rule : { (0,0,0) } 1 { (0,0,0) < 311 }

%Unburned
rule : { #macro(unburned) } 1 { (0,0,0) < 573 AND (0,0,0) != 209 AND ( #macro(unburned) > (0,0,0) OR time <= 20 )  }

%Burning
rule : { #macro(burning) } 1 { (0,0,0) != 209 AND ( ( (0,0,0) > #macro(burning) AND (0,0,0) > 333) OR (#macro(burning) > (0,0,0) AND (0,0,0) >= 573) ) }

%Burned
rule : { 209 } 1 { (0,0,0) <= 333 AND (0,0,0) != 209 AND (0,0,0) > #macro(burning) }

%Stay Burned or constant
rule : { (0,0,0) } 1 { t }

%[wakeup]
%rule : { 1.0 } 1 { (0,0,0) = 0.0 }
%rule : { 0.0 } 1 { (0,0,0) = 1.0 }
