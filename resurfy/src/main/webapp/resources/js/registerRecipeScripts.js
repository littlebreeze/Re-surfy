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
    select.id = 'ingreType';
    select.setAttribute('control-id', 'ControlID-11');
    
    const option1 = document.createElement('option');
    option1.value = '';
    option1.text = '재료별';
    const option2 = document.createElement('option');
    option2.value = '3060001|주재료';
    option2.text = '주재료';
    const option3 = document.createElement('option');
    option3.value = '3060002|부재료';
    option3.text = '부재료';
    const option4 = document.createElement('option');
    option4.value = '3060003|양념';
    option4.text = '양념';
    
    select.add(option1);
    select.add(option2);
    select.add(option3);
    select.add(option4);
    
    const li = document.createElement('li');
    li.id = `liIngredient_${ingredientCounter}_1`;
    
    const input1 = document.createElement('input');
    input1.type = 'text';
    input1.name = `ingreName_${ingredientCounter}[]`;
    input1.id = `ingreName_${ingredientCounter}_1`;
    input1.className = 'addIngredient_name';
    input1.style = 'width:285px; border-radius: 0.375rem';
    input1.placeholder = '예) 돼지고기';
    input1.setAttribute('control-id', 'ControlID-19');
    
    const input2 = document.createElement('input');
    input2.type = 'text';
    input2.name = `ingreMeasure_${ingredientCounter}[]`;
    input2.id = `ingreMeasure_${ingredientCounter}_1`;
    input2.className = 'addIngredient_amount';
    input2.style = 'width:210px; border-radius: 0.375rem';
    input2.placeholder = '예) 300g';
    input2.setAttribute('control-id', 'ControlID-20');
    
    const deleteButton = document.createElement('button');
    deleteButton.type = 'button';
    deleteButton.className = 'btn btn-warning deleteIngredientBtn';
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
        const newFileInput = document.getElementById(`q_step_file_${stepCounter}`);
    newFileInput.setAttribute('id', `q_step_file_${stepCounter}`);
    newFileInput.setAttribute('name', `q_step_file_${stepCounter}`);
    setFileInputEventListener(stepCounter);
	
    // Add event listener to the new file input
    const fileInput = document.getElementById(`q_step_file_${stepCounter}`);
    fileInput.addEventListener('change', function (event) {
        const step = this.id.split('_')[2];
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
}

function browseStepFile(step) {
    const fileInput = document.getElementById(`q_step_file_${step}`);
    fileInput.click();
}

// 순서 제거 함수
function deleteStep(step) {
    const stepElement = document.getElementById(`stepItem_${step}`);
    stepElement.remove();

    for (let i = step + 1; i <= stepCounter; i++) {
        const stepToUpdate = document.getElementById(`stepItem_${i}`);
        const stepNumToUpdate = document.getElementById(`stepNum_${i}`);
        const stepDescToUpdate = document.getElementById(`stepDescription_${i}`);
        const stepImageBoxToUpdate = document.getElementById(`stepImageBox_${i}`);
        const stepFileInput = document.getElementById(`q_step_file_${i}`);

        stepNumToUpdate.innerHTML = `Step ${i - 1}`;
        stepToUpdate.id = `stepItem_${i - 1}`;
        stepNumToUpdate.id = `stepNum_${i - 1}`;
        stepDescToUpdate.id = `stepDescription_${i - 1}`;
        stepImageBoxToUpdate.id = `stepImageBox_${i - 1}`;
        stepImageBoxToUpdate.setAttribute('onclick', `browseStepFile(${i - 1})`);
        stepFileInput.id = `q_step_file_${i - 1}`;
    }

    stepCounter--;
}

// Initialize event listener for the first step
document.addEventListener("DOMContentLoaded", function () {
    setFileInputEventListener(1);
});

function setFileInputEventListener(step) {
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
}




   
		
		
		//등록권한
    function validateForm() {
        // 유효성 검사를 수행할 모든 필드를 가져옵니다.
        const recipeName = document.getElementById('recipeName');
        const recipeDescription = document.getElementById('recipeDescription');
        const image = document.getElementById('image');
        const foodType = document.getElementById('foodType');
        const person = document.getElementById('person');
        const difficulty = document.getElementById('difficulty');
        const time = document.getElementById('time');
        const ingreType = document.getElementById('ingreType');
        const ingreName = document.getElementById('ingreName');
        const ingreMeasure = document.getElementById('ingreMeasure');
        const stepDescription = document.getElementById('stepDescription');

        // 레시피 이름 유효성 검사
        if (recipeName.value.trim() === "") {
            alert("레시피 이름을 입력해주세요.");
            recipeName.focus();
            return false;
        }

        // 레시피 설명 유효성 검사
        if (recipeDescription.value.trim() === "") {
            alert("레시피 설명을 입력해주세요.");
            recipeDescription.focus();
            return false;
        }

        // 이미지 유효성 검사
        if (image.value.trim() === "") {
            alert("이미지를 업로드해주세요.");
            image.focus();
            return false;
        }

        // 음식 유형 유효성 검사
        if (foodType.selectedIndex === 0) {
            alert("음식 유형을 선택해주세요.");
            foodType.focus();
            return false;
        }

        // 인원 수 유효성 검사
        if (person.selectedIndex === 0) {
            alert("인원 수를 선택해주세요.");
            person.focus();
            return false;
        }

        // 난이도 유효성 검사
        if (difficulty.selectedIndex === 0) {
            alert("난이도를 선택해주세요.");
            difficulty.focus();
            return false;
        }

        // 시간 유효성 검사
        if (time.selectedIndex === 0) {
            alert("시간을 입력해주세요.");
            time.focus();
            return false;
        }
        // 재료 유형 유효성 검사
        if (ingreType.selectedIndex === 0) {
            alert("시간을 입력해주세요.");
            ingreType.focus();
            return false;
        }
        // 재료명 유효성 검사
        if (ingreName.value.trim() === "") {
            alert("시간을 입력해주세요.");
            ingreName.focus();
            return false;
        }
        // 재료양 유효성 검사
        if (ingreMeasure.value.trim() === "") {
            alert("시간을 입력해주세요.");
            ingreMeasure.focus();
            return false;
        }
        // 과정 설명 유효성 검사
        if (stepDescription.value.trim() === "") {
            alert("시간을 입력해주세요.");
            stepDescription.focus();
            return false;
        }
        
        

        // ... (다른 필드에 대한 유효성 검사 추가)

        // 모든 유효성 검사를 통과하면 폼을 제출합니다.
        return true;
    }		
