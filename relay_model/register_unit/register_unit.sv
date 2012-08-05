module RegisterUnit(input ldA, ldB, ldC, ldD, ldM1, ldM2, ldX, ldY, ldXY
		    selA, selB, selC, selD, selM1, selM2, selX, selY, selM, selXY
		    AddressBus address, DataBus data);
  
   Register a(ldA, selA, data.data);
   Register b(ldB, selB, data.data);
   Register c(ldC, selC, data.data);
   Register d(ldD, selD, data.data);
   Register m1(ldM1, selM1, data.data);
   Register m2(ldM2, selM2, data.data);
   Register x(ldX, selX, data.data);
   Register y(ldY, selY, data.data);

   // TODO attach the address bus to M and XY
 
  
   
endmodule // RegisterUnit
