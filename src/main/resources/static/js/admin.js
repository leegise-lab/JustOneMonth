/**
 * 
 */
layerlist = new Array ('shop1','shop2','shop3','shop4','shop5','shop6','shop7','shop8','shop9');
	let thisshop="";
	let ino=layerlist.length;
	
	
	function Change(){
		if(document.all){
			for(i=0;i<ino;i++) {
				document.all(layerlist[i]).style.display="none";
			}
			stobj="document.all(shop).style";
		} else if(document.getElementById){
			for(i=0;i<ino;i++) {
				document.getElementById(layerlist[i]).style.display="none";
			}
			stobj="document.getElementById(shop).style";
		} else if(document.layers){
			for(i=0;i<ino;i++) {
				document.layers[layerlist[i]].display=none;
			}
			stobj="document.layers[shop]";
		}
	}

	function ChangeMenu(shop){
		if ( thisshop !== shop){
			Change();
			eval(stobj).display="block";
			thisshop=shop;
		} else{
			Change();
			//eval(stobj).display="block";
			thisshop=stobj;
		}
	}

	function InitMenu(shop) {
		try {
			if(document.all){
				document.all(shop).style.display="block";
			} else if(document.getElementById){
				document.getElementById(shop).style.display="block";
			} else if(document.layers){
				document.layers[shop].display="block";
			}
		} catch (e) {
			/*
			shop = "shop1";
			if(document.all){
				document.all(shop).style.display="block";
			} else if(document.getElementById){
				document.getElementById(shop).style.display="block";
			} else if(document.layers){
				document.layers[shop].display="block";
			}
			*/
		}
	}

	function GoNoticeView(artid) {
		url="shop_notice.php?boardtype=view&artid="+artid;
		document.location.href=url;
	}
	function GoCounselView(artid) {
		url="shop_counsel.php?boardtype=view&artid="+artid;
		document.location.href=url;
	}
	
	//CS 관리 함수 2016-08-25 Seul
	function OrderDetailView(ordercode) {
		document.detailform.ordercode.value = ordercode;
		window.open("","vorderdetail","scrollbars=yes,width=800,height=600");
		document.detailform.submit();
	}
	
	//상품 QnA 함수 2016-08-25 Seul
	function viewArticle(num) {
		//view, modify, write
		document.procForm.num.value=num;
		document.procForm.action="order_qnaview.php";
		document.procForm.submit();
	}