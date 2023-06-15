	if abs(vx1(end)-vx1(end-1))==0 	
	%      x1
	if abs(vx1(end)-vx1(end-1))<amin 
	%     1
	bifx1(m,:)=vx1(end-45:end-1);
	else
	%     2
	vx1 = vx1(1:max(size(vx1)));  
	lmx1 = locmax(vx1);
	vx1 = vx1(lmx1);
	for jv = 0:1:44
	bifx1(m,jv+1) = vx1(max(size(vx1))-jv);
	end
	end   	
	%      x2
	if abs(vx2(end)-vx2(end-1))<amin 
	%     1
	bifx2(m,:)=vx2(end-45:end-1);
	else
	%     2
	vx2 = vx2(1:max(size(vx2)));  
	lmx2 = locmax(vx2);
	vx2 = vx2(lmx2);
	for jv = 0:1:44
	bifx2(m,jv+1) = vx2(max(size(vx2))-jv);
	end
	end	
	%      x3
	if abs(vx3(end)-vx3(end-1))<amin 
	%     1
	bifx3(m,:)=vx3(end-45:end-1);
	else
	%     2
	vx3 = vx3(1:max(size(vx3)));  
	lmx3 = locmax(vx3);
	vx3 = vx3(lmx3);
	for jv = 0:1:44
	bifx3(m,jv+1) = vx3(max(size(vx3))-jv);
	end
	end
	%      x4
	if abs(vx4(end)-vx4(end-1))<amin 
	%     1
	bifx4(m,:)=vx4(end-45:end-1);
	else
	%     2
	vx4 = vx4(1:max(size(vx4)));  
	lmx4 = locmax(vx4);
	vx4 = vx4(lmx4);
	for jv = 0:1:44
	bifx4(m,jv+1) = vx4(max(size(vx4))-jv);
	end
	end	
	%      x5
	if abs(vx5(end)-vx5(end-1))<amin  
	%     1
	bifx5(m,:)=vx5(end-45:end-1);
	else
	%     2
	vx5 = vx5(1:max(size(vx5)));  
	lmx5 = locmax(vx5);
	vx5 = vx5(lmx5);
	for jv = 0:1:44
	bifx5(m,jv+1) = vx5(max(size(vx5))-jv);
	end
	end
	%      x6
	if abs(vx6(end)-vx6(end-1))<amin 
	%     1
	bifx6(m,:)=vx6(end-45:end-1);
	else
	%     2
	vx6 = vx6(1:max(size(vx6)));  
	lmx6 = locmax(vx6);
	vx6 = vx6(lmx6);
	for jv = 0:1:44
	bifx6(m,jv+1) = vx6(max(size(vx6))-jv);
	end
	end 	
	%      x7
	if abs(vx7(end)-vx7(end-1))<amin 
	%     1
	bifx7(m,:)=vx7(end-45:end-1);
	else
	%     2
	vx7 = vx7(1:max(size(vx7)));  
	lmx7 = locmax(vx7);
	vx7 = vx7(lmx7);
	for jv = 0:1:44
	bifx7(m,jv+1) = vx7(max(size(vx7))-jv);
	end
	end    	
	%      x8
	if abs(vx8(end)-vx8(end-1))<amin  
	%     1
	bifx8(m,:)=vx8(end-45:end-1);
	else
	%     2
	vx8 = vx8(1:max(size(vx8)));  
	lmx8 = locmax(vx8);
	vx8 = vx8(lmx8);
	for jv = 0:1:44
	bifx8(m,jv+1) = vx8(max(size(vx8))-jv);
	end
	end 	
	%      x9
	if abs(vx9(end)-vx9(end-1))<amin  
	%     1
	bifx9(m,:)=vx9(end-45:end-1);
	else
	%     2
	vx9 = vx9(1:max(size(vx9)));  
	lmx9 = locmax(vx9);
	vx9 = vx9(lmx9);
	for jv = 0:1:44
	bifx9(m,jv+1) = vx9(max(size(vx9))-jv);
	end
	end 	
	%      x10
	if abs(vx10(end)-vx10(end-1))<amin  
	%     1
	bifx10(m,:)=vx10(end-45:end-1);
	else
	%     2
	vx10 = vx10(1:max(size(vx10)));  
	lmx10 = locmax(vx10);
	vx10 = vx10(lmx10);
	for jv = 0:1:44
	bifx10(m,jv+1) = vx10(max(size(vx10))-jv);
	end
	end   
	%      x11
	if abs(vx11(end)-vx11(end-1))<amin  
	%     1
	bifx11(m,:)=vx11(end-45:end-1);
	else
	%     2
	vx11 = vx11(1:max(size(vx11)));  
	lmx11 = locmax(vx11);
	vx11 = vx11(lmx11);
	for jv = 0:1:44
	bifx11(m,jv+1) = vx11(max(size(vx11))-jv);
	end
	end 
	%      x12
	if abs(vx12(end)-vx12(end-1))<amin  
	%     1
	bifx12(m,:)=vx12(end-45:end-1);
	else
	%     2
	vx12 = vx12(1:max(size(vx12)));  
	lmx12 = locmax(vx12);
	vx12 = vx12(lmx12);
	for jv = 0:1:44
	bifx12(m,jv+1) = vx12(max(size(vx12))-jv);
	end
	end 	
	%      y1
	if abs(vy1(end)-vy1(end-1))<amin  
	%     1
	bify1(m,:)=vy1(end-45:end-1);
	else
	%     2
	vy1 = vy1(1:max(size(vy1)));  
	lmy1 = locmax(vy1);
	vy1 = vy1(lmy1);
	for jv = 0:1:44
	bify1(m,jv+1) = vy1(max(size(vy1))-jv);
	end
	end	
	%      y2
	if abs(vy2(end)-vy2(end-1))<amin   
	%     1
	bify2(m,:)=vy2(end-45:end-1);
	else
	%     2
	vy2 = vy2(1:max(size(vy2)));  
	lmy2 = locmax(vy2);
	vy2 = vy2(lmy2);
	for jv = 0:1:44
	bify2(m,jv+1) = vy2(max(size(vy2))-jv);
	end
	end	
	%      y3
	if abs(vy3(end)-vy3(end-1))<amin   
	%     1
	bify3(m,:)=vy3(end-45:end-1);
	else
	%     2
	vy3 = vy3(1:max(size(vy3)));  
	lmy3 = locmax(vy3);
	vy3 = vy3(lmy3);
	for jv = 0:1:44
	bify3(m,jv+1) = vy3(max(size(vy3))-jv);
	end
	end   
	%      y4
	if abs(vy4(end)-vy4(end-1))<amin   
	%     1
	bify4(m,:)=vy4(end-45:end-1);
	else
	%     2
	vy4 = vy4(1:max(size(vy4)));  
	lmy4 = locmax(vy4);
	vy4 = vy4(lmy4);
	for jv = 0:1:44
	bify4(m,jv+1) = vy4(max(size(vy4))-jv);
	end
	end	
	%      y5
	if abs(vy5(end)-vy5(end-1))<amin   
	%     1
	bify5(m,:)=vy5(end-45:end-1);
	else
	%     2
	vy5 = vy5(1:max(size(vy5)));  
	lmy5 = locmax(vy5);
	vy5 = vy5(lmy5);
	for jv = 0:1:44
	bify5(m,jv+1) = vy5(max(size(vy5))-jv);
	end
	end   	
	%      y6
	if abs(vy6(end)-vy6(end-1))<amin   
	%     1
	bify6(m,:)=vy6(end-45:end-1);
	else
	%     2
	vy6 = vy6(1:max(size(vy6)));  
	lmy6 = locmax(vy6);
	vy6 = vy6(lmy6);
	for jv = 0:1:44
	bify6(m,jv+1) = vy6(max(size(vy6))-jv);
	end
	end   	
	%      y7
	if abs(vy7(end)-vy7(end-1))<amin  
	%     1
	bify7(m,:)=vy7(end-45:end-1);
	else
	%     2
	vy7 = vy7(1:max(size(vy7)));  
	lmy7 = locmax(vy7);
	vy7 = vy7(lmy7);
	for jv = 0:1:44
	bify7(m,jv+1) = vy7(max(size(vy7))-jv);
	end
	end   	
	%      y8
	if abs(vy8(end)-vy8(end-1))<amin   
	%     1
	bify8(m,:)=vy8(end-45:end-1);
	else
	%     2
	vy8 = vy8(1:max(size(vy8)));  
	lmy8 = locmax(vy8);
	vy8 = vy8(lmy8);
	for jv = 0:1:44
	bify8(m,jv+1) = vy8(max(size(vy8))-jv);
	end
	end   	
	%      y9
	if abs(vy9(end)-vy9(end-1))<amin   
	%     1
	bify9(m,:)=vy9(end-45:end-1);
	else
	%     2
	vy9 = vy9(1:max(size(vy9)));  
	lmy9 = locmax(vy9);
	vy9 = vy9(lmy9);
	for jv = 0:1:44
	bify9(m,jv+1) = vy9(max(size(vy9))-jv);
	end
	end 	
	%      y10
	if abs(vy10(end)-vy10(end-1))<amin  
	%     1
	bify10(m,:)=vy10(end-45:end-1);
	else
	%     2
	vy10 = vy10(1:max(size(vy10)));  
	lmy10 = locmax(vy10);
	vy10 = vy10(lmy10);
	for jv = 0:1:44
	bify10(m,jv+1) = vy10(max(size(vy10))-jv);
	end
	end      
	%      y11
	if abs(vy11(end)-vy11(end-1))<amin  
	%     1
	bify11(m,:)=vy11(end-45:end-1);
	else
	%     2
	vy11 = vy11(1:max(size(vy11)));  
	lmy11 = locmax(vy11);
	vy11 = vy11(lmy11);
	for jv = 0:1:44
	bify11(m,jv+1) = vy11(max(size(vy11))-jv);
	end
	end  	
	%      y12
	if abs(vy12(end)-vy12(end-1))<amin  
	%     1
	bify12(m,:)=vy12(end-45:end-1);
	else
	%     2
	vy12 = vy12(1:max(size(vy12)));  
	lmy12 = locmax(vy12);
	vy12 = vy12(lmy12);
	for jv = 0:1:44
	bify12(m,jv+1) = vy12(max(size(vy12))-jv);
	end
	end 	
	else
	%      x1
	vx1 = vx1(1:max(size(vx1)));  
	lmx1 = locmax(vx1);
	vx1 = vx1(lmx1);
	for jv = 0:1:44
	bifx1(m,jv+1) = vx1(max(size(vx1))-jv);
	end	
	%      x2
	vx2 = vx2(1:max(size(vx2)));  
	lmx2 = locmax(vx2);
	vx2 = vx2(lmx2);
	for jv = 0:1:44
	bifx2(m,jv+1) = vx2(max(size(vx2))-jv);
	end	
	%      x3
	vx3 = vx3(1:max(size(vx3)));  
	lmx3 = locmax(vx3);
	vx3 = vx3(lmx3);
	for jv = 0:1:44
	bifx3(m,jv+1) = vx3(max(size(vx3))-jv);
	end	
	%      x4
	vx4 = vx4(1:max(size(vx4)));  
	lmx4 = locmax(vx4);
	vx4 = vx4(lmx4);
	for jv = 0:1:44
	bifx4(m,jv+1) = vx4(max(size(vx4))-jv);
	end	
	%      x5
	vx5 = vx5(1:max(size(vx5)));  
	lmx5 = locmax(vx5);
	vx5 = vx5(lmx5);
	for jv = 0:1:44
	bifx5(m,jv+1) = vx5(max(size(vx5))-jv);
	end	
	%      x6
	vx6 = vx6(1:max(size(vx6)));  
	lmx6 = locmax(vx6);
	vx6 = vx6(lmx6);
	for jv = 0:1:44
	bifx6(m,jv+1) = vx6(max(size(vx6))-jv);
	end	
	%      x7
	vx7 = vx7(1:max(size(vx7)));  
	lmx7 = locmax(vx7);
	vx7 = vx7(lmx7);
	for jv = 0:1:44
	bifx7(m,jv+1) = vx7(max(size(vx7))-jv);
	end	
	%      x8
	vx8 = vx8(1:max(size(vx8)));  
	lmx8 = locmax(vx8);
	vx8 = vx8(lmx8);
	for jv = 0:1:44
	bifx8(m,jv+1) = vx8(max(size(vx8))-jv);
	end	
	%      x9
	vx9 = vx9(1:max(size(vx9)));  
	lmx9 = locmax(vx9);
	vx9 = vx9(lmx9);
	for jv = 0:1:44
	bifx9(m,jv+1) = vx9(max(size(vx9))-jv);
	end	
	%      x10
	vx10 = vx10(1:max(size(vx10)));  
	lmx10 = locmax(vx10);
	vx10 = vx10(lmx10);
	for jv = 0:1:44
	bifx10(m,jv+1) = vx10(max(size(vx10))-jv);
	end	
	%      x11
	vx11 = vx11(1:max(size(vx11)));  
	lmx11 = locmax(vx11);
	vx11 = vx11(lmx11);
	for jv = 0:1:44
	bifx11(m,jv+1) = vx11(max(size(vx11))-jv);
	end
	%      x12
	vx12 = vx12(1:max(size(vx12)));  
	lmx12 = locmax(vx12);
	vx12 = vx12(lmx12);
	for jv = 0:1:44
	bifx12(m,jv+1) = vx12(max(size(vx12))-jv);
	end	
	%      y1
	vy1 = vy1(1:max(size(vy1)));  
	lmy1 = locmax(vy1);
	vy1 = vy1(lmy1);
	for jv = 0:1:44
	bify1(m,jv+1) = vy1(max(size(vy1))-jv);
	end	
	%      y2
	vy2 = vy2(1:max(size(vy2)));  
	lmy2 = locmax(vy2);
	vy2 = vy2(lmy2);
	for jv = 0:1:44
	bify2(m,jv+1) = vy2(max(size(vy2))-jv);
	end	
	%      y3
	vy3 = vy3(1:max(size(vy3)));  
	lmy3 = locmax(vy3);
	vy3 = vy3(lmy3);
	for jv = 0:1:44
	bify3(m,jv+1) = vy3(max(size(vy3))-jv);
	end	
	%      y4
	vy4 = vy4(1:max(size(vy4)));  
	lmy4 = locmax(vy4);
	vy4 = vy4(lmy4);
	for jv = 0:1:44
	bify4(m,jv+1) = vy4(max(size(vy4))-jv);
	end	
	%      y5
	vy5 = vy5(1:max(size(vy5)));  
	lmy5 = locmax(vy5);
	vy5 = vy5(lmy5);
	for jv = 0:1:44
	bify5(m,jv+1) = vy5(max(size(vy5))-jv);
	end	
	%      y6
	vy6 = vy6(1:max(size(vy6)));  
	lmy6 = locmax(vy6);
	vy6 = vy6(lmy6);
	for jv = 0:1:44
	bify6(m,jv+1) = vy6(max(size(vy6))-jv);
	end	
	%      y7
	vy7 = vy7(1:max(size(vy7)));  
	lmy7 = locmax(vy7);
	vy7 = vy7(lmy7);
	for jv = 0:1:44
	bify7(m,jv+1) = vy7(max(size(vy7))-jv);
	end	
	%      y8
	vy8 = vy8(1:max(size(vy8)));  
	lmy8 = locmax(vy8);
	vy8 = vy8(lmy8);
	for jv = 0:1:44
	bify8(m,jv+1) = vy8(max(size(vy8))-jv);
	end	
	%      y9
	vy9 = vy9(1:max(size(vy9)));  
	lmy9 = locmax(vy9);
	vy9 = vy9(lmy9);
	for jv = 0:1:44
	bify9(m,jv+1) = vy9(max(size(vy9))-jv);
	end	
	%      y10
	vy10 = vy10(1:max(size(vy10)));  
	lmy10 = locmax(vy10);
	vy10 = vy10(lmy10);
	for jv = 0:1:44
	bify10(m,jv+1) = vy10(max(size(vy10))-jv);
	end	
	%      y11
	vy11 = vy11(1:max(size(vy11)));  
	lmy11 = locmax(vy11);
	vy11 = vy11(lmy11);
	for jv = 0:1:44
	bify11(m,jv+1) = vy11(max(size(vy11))-jv);
	end	
	%      y12
	vy12 = vy12(1:max(size(vy12)));  
	lmy12 = locmax(vy12);
	vy12 = vy12(lmy12);
	for jv = 0:1:44
	bify12(m,jv+1) = vy12(max(size(vy12))-jv);
	end		
	end