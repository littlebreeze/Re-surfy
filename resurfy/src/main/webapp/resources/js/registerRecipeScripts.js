/*!
* Start Bootstrap - Simple Sidebar v6.0.6 (https://startbootstrap.com/template/simple-sidebar)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-simple-sidebar/blob/master/LICENSE)
*/
// 
// Scripts
// 

  //메인 이미지 업로드
    function browseMainFile() {
    const fileInput = document.getElementById("mainImage");
    fileInput.click();
    }
    
    function onMainFileChange(event) {
    const file = event.target.files[0];
    const reader = new FileReader();
    
    reader.onload = function (e) {
    const mainImageHolder = document.getElementById("mainImageHolder");
    mainImageHolder.src = e.target.result;
    mainImageHolder.style.width = "100%";
    mainImageHolder.style.height = "250px";
    };
    
    reader.readAsDataURL(file);
    }
    
    document.getElementById("mainImage").addEventListener("change", onMainFileChange);
    
    
    
    //재료 추가 함수
    let ingredientCounter = 1;
    
    function addIngredient() {
    ingredientCounter++;
    
    const newIngredientGroup = document.createElement('ul');
    newIngredientGroup.id = `ingredientAra_${ingredientCounter}`;
    newIngredientGroup.className = 'ingredientGroup';
    
    const select = document.createElement('select');
    select.className = 'form-select';
    select.id = 'ingredient_type';
    select.setAttribute('control-id', 'ControlID-11');
    
    const option1 = document.createElement('option');
    option1.value = '';
    option1.text = '재료별';
    const option2 = document.createElement('option');
    option2.value = '23';
    option2.text = '주재료';
    const option3 = document.createElement('option');
    option3.value = '28';
    option3.text = '부재료';
    const option4 = document.createElement('option');
    option4.value = '24';
    option4.text = '양념';
    
    select.add(option1);
    select.add(option2);
    select.add(option3);
    select.add(option4);
    
    const li = document.createElement('li');
    li.id = `liIngredient_${ingredientCounter}_1`;
    
    const input1 = document.createElement('input');
    input1.type = 'text';
    input1.name = `addIngredient_name_${ingredientCounter}[]`;
    input1.id = `recipIngredient_name_${ingredientCounter}_1`;
    input1.className = 'addIngredient_name';
    input1.style = 'width:285px; border-radius: 0.375rem';
    input1.placeholder = '예) 돼지고기';
    input1.setAttribute('control-id', 'ControlID-19');
    
    const input2 = document.createElement('input');
    input2.type = 'text';
    input2.name = `addIngredient_amount_${ingredientCounter}[]`;
    input2.id = `recipIngredient_amount_${ingredientCounter}_1`;
    input2.className = 'addIngredient_amount';
    input2.style = 'width:210px; border-radius: 0.375rem';
    input2.placeholder = '예) 300g';
    input2.setAttribute('control-id', 'ControlID-20');
    
    const deleteButton = document.createElement('button');
    deleteButton.type = 'button';
    deleteButton.className = 'btn btn-danger deleteIngredientBtn';
    deleteButton.textContent = '삭제';
    deleteButton.onclick = function () {
    const remainingIngredientGroups = document.getElementsByClassName('ingredientGroup');
    if (remainingIngredientGroups.length > 1) {
    newIngredientGroup.remove();
    }
    };
    
    li.appendChild(input1);
    li.appendChild(input2);
    li.appendChild(deleteButton);
    
    newIngredientGroup.appendChild(select);
    newIngredientGroup.appendChild(li);
    
    const divIngredientGroupArea = document.getElementById('divIngredientGroupArea');
    divIngredientGroupArea.appendChild(newIngredientGroup);
    }
    
    document.getElementById('addIngredient').addEventListener('click', addIngredient);
    
    //순서 추가 함수
    let stepCounter = 1;
	
	function addStep() {
	    stepCounter++;
	    const stepTemplate = document.getElementById('stepTemplate');
	    const stepArea = document.getElementById('stepArea');
	    const newStep = stepTemplate.innerHTML.replace(/STEP/g, stepCounter);
	    stepArea.insertAdjacentHTML('beforeend', newStep);
	    const deleteButton = document.getElementById(`stepItem_${stepCounter}`).getElementsByClassName("deleteStepBtn")[0];
	    deleteButton.setAttribute('onclick', `deleteStep(${stepCounter})`);
	    const stepImageBoxToUpdate = document.getElementById(`stepImageBox_${stepCounter}`);
		stepImageBoxToUpdate.setAttribute('onclick', `browseStepFile(${stepCounter})`);
	    
	}
	
	function browseStepFile(step) {
	    const fileInput = document.getElementById(`q_step_file_${step}`);
	    fileInput.addEventListener('change', function (event) {
	        const file = event.target.files[0];
	        if (file) {
	            const reader = new FileReader();
	            reader.onload = function (e) {
	                const img = document.getElementById(`stepImageHolder_${step}`);
	                img.src = e.target.result;
	            };
	            reader.readAsDataURL(file);
	        }
	    });
	    fileInput.click();
	}
	



    
    //순서 제거 함수
	function deleteStep(step) {
    const stepElement = document.getElementById(`stepItem_${step}`);
    stepElement.remove();
    
    for (let i = step + 1; i <= stepCounter; i++) {
        const stepToUpdate = document.getElementById(`stepItem_${i}`);
        const stepNumToUpdate = document.getElementById(`stepNum_${i}`);
        const stepDescToUpdate = document.getElementById(`stepDescription_${i}`);
        const stepImageBoxToUpdate = document.getElementById(`stepImageBox_${i}`);
        
        stepNumToUpdate.innerHTML = `Step ${i - 1}`;
        stepToUpdate.id = `stepItem_${i - 1}`;
        stepNumToUpdate.id = `stepNum_${i - 1}`;
        stepDescToUpdate.id = `stepDescription_${i - 1}`;
        stepImageBoxToUpdate.setAttribute('onclick', `browseStepFile(${i - 1})`);
    }
    
    stepCounter--;
}

    
    //과정 이미지 업로드
    
  
    
    //등록 버튼 구현
    function save() {
    // 저장 버튼 클릭 시 실행될 로직
    // 모든 정보가 입력되었는지 확인하는 코드 작성
    // 입력이 완료되면 모달창 열기
    const openModal = document.getElementById("openModal");
    openModal.style.display = "block";
    }
    
    function confirm() {
    const title = document.getElementById("title").value;
    const category = document.getElementById("category").value;
    const mainPhoto = document.getElementById("main_photo").value;
    const content = document.getElementById("content").value;
    const ingredients = document.getElementsByClassName("ingre");
    
    // 필수 입력 항목 검증
    if (title === "" || category === "" || mainPhoto === "" || content === "") {
    alert("필수 입력 항목을 모두 입력해주세요.");
    return;
    }
    
    // 재료 입력 항목 검증
    for (let i = 0; i < ingredients.length; i++) {
    const ingredient = ingredients[i].value;
    if (ingredient === "") {
    alert("재료 입력 항목을 모두 입력해주세요.");
    return;
    }
    }
    
    // 서버로 데이터 전송 (예시)
    const formData = new FormData();
    formData.append("title", title);
    formData.append("category", category);
    formData.append("mainPhoto", mainPhoto);
    formData.append("content", content);
    
    for (let i = 0; i < ingredients.length; i++) {
    const ingredient = ingredients[i].value;
    formData.append("ingredients", ingredient);
    }
    
    fetch("/save", {
    method: "POST",
    body: formData,
    })
    .then((response) => response.json())
    .then((data) => {
    if (data.success) {
    // 저장 성공 시 처리
    alert("저장되었습니다.");
    location.href = "/recipe/get";
    } else {
    // 저장 실패 시 처리
    alert("저장에 실패하였습니다.");
    }
    });
    
    // 확인 버튼 클릭 시 실행될 로직
    // 서버로 저장할 수 있는 자바스크립트 코드 작성
    }
    
    function cancle() {
    // 취소 버튼 클릭 시 실행될 로직
    }