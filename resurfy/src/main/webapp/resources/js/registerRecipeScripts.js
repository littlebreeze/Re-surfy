/*!
* Start Bootstrap - Simple Sidebar v6.0.6 (https://startbootstrap.com/template/simple-sidebar)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-simple-sidebar/blob/master/LICENSE)
*/
// 
// Scripts
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
    mainImageHolder.style.height = "280px";
    };
    
    reader.readAsDataURL(file);
    }
    
    document.getElementById("mainImage").addEventListener("change", onMainFileChange);

document.getElementById("mainImage").addEventListener("change", onMainFileChange);

    
    //재료 추가 함수
    let ingredientCounter = 1;
    
    function addIngredient() {
    ingredientCounter++;
    
    const newIngredientGroup = document.createElement('ul');
    newIngredientGroup.id = `ingredientAra_${ingredientCounter}`;
    newIngredientGroup.className = 'ingredientGroup';
    newIngredientGroup.style = 'margin-left: 145px; display: inline-flex;';
    
    const select = document.createElement('select');
    select.className = 'form-select';
    select.id = 'ingreType';
    select.name = 'ingreType';
    select.setAttribute('control-id', 'ControlID-11');
    
    const option1 = document.createElement('option');
    option1.value = '';
    option1.text = '재료별';
    const option2 = document.createElement('option');
    option2.value = '주재료';
    option2.text = '주재료';
    const option3 = document.createElement('option');
    option3.value = '부재료';
    option3.text = '부재료';
    const option4 = document.createElement('option');
    option4.value = '양념';
    option4.text = '양념';
    
    select.add(option1);
    select.add(option2);
    select.add(option3);
    select.add(option4);
    
    const li = document.createElement('li');
    li.id = `liIngredient_${ingredientCounter}_1`;
    
    const input1 = document.createElement('input');
    input1.type = 'text';
    input1.id = `ingreName_${ingredientCounter}_1`;
    input1.name = `ingreName`;
    input1.className = 'addIngredient_name';
    input1.style = 'width:275px; border-radius: 0.375rem';
    input1.placeholder = '예) 돼지고기';
    input1.setAttribute('control-id', 'ControlID-19');
    
    const input2 = document.createElement('input');
    input2.type = 'text';
    input2.id = `ingreMeasure_${ingredientCounter}_1`;
    input2.name = `ingreMeasure`;
    input2.className = 'addIngredient_amount';
    input2.style = 'width:180px; border-radius: 0.375rem; margin: 0px 7px 0px 8px';
    input2.placeholder = '예) 300g';
    input2.setAttribute('control-id', 'ControlID-20');
    
    const deleteButton = document.createElement('button');
    deleteButton.type = 'button';
    deleteButton.className = 'btn btn-warning deleteIngredientBtn';
    deleteButton.textContent = 'X';
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
  const stepTemplate = document.getElementById("stepTemplate");
  const newStep = stepTemplate.innerHTML.replace(/STEP/g, stepCounter);
  stepArea.insertAdjacentHTML("beforeend", newStep);

  const deleteButton = document.getElementById(`stepItem_${stepCounter}`).getElementsByClassName("deleteStepBtn")[0];
  deleteButton.setAttribute("onclick", `deleteStep(${stepCounter})`);

  const stepImageBoxToUpdate = document.getElementById(`stepImageBox_${stepCounter}`);
  stepImageBoxToUpdate.setAttribute("onclick", `browseStepFile(${stepCounter})`);

  const newFileInput = document.getElementById(`q_step_file_${stepCounter}`);
  newFileInput.setAttribute("id", `q_step_file_${stepCounter}`);
  newFileInput.setAttribute("name", `q_step_file_${stepCounter}`);

  // Add event listener to the new file input
  setFileInputEventListener(stepCounter);
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
    const stepDelete = document.getElementById(`deleteStepBtn_${i}`);

    stepNumToUpdate.innerHTML = `Step ${i - 1}`;
    stepToUpdate.id = `stepItem_${i - 1}`;
    stepNumToUpdate.id = `stepNum_${i - 1}`;
    stepDescToUpdate.id = `stepDescription_${i - 1}`;
    stepImageBoxToUpdate.id = `stepImageBox_${i - 1}`;
    stepImageBoxToUpdate.setAttribute("onclick", `browseStepFile(${i - 1})`);
    stepFileInput.id = `q_step_file_${i - 1}`;
    stepDelete.id = `deleteStepBtn_${i-1}`;
    stepDelete.setAttribute("onclick", `deleteStep(${i - 1})`);
  }

  stepCounter--;
}

// Initialize event listener for the first step
document.addEventListener("DOMContentLoaded", function () {
  setFileInputEventListener(1);
});

function setFileInputEventListener(step) {
  const fileInput = document.getElementById(`q_step_file_${step}`);
  fileInput.addEventListener("change", function (event) {
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
  const recipeName = document.getElementById("recipeName").value;
  const recipeDescription = document.getElementById("recipeDescription").value;
  const mainImage = document.getElementById("mainImage").value;
  const foodType = document.getElementById("foodType").value;
  const person = document.getElementById("person").value;
  const time = document.getElementById("time").value;
  const difficulty = document.getElementById("difficulty").value;
  const ingreType = document.getElementById("ingreType").value;
  

  if (recipeName === "") {
    alert("레시피 제목을 입력하세요.");
    return false;
  }

  if (recipeDescription === "") {
    alert("요리 소개를 입력하세요.");
    return false;
  }
  
   if (mainImage === "") {
    alert("레시피 대표 이미지를 업로드하세요.");
    return false;
  }

  if (foodType === "") {
    alert("음식 유형을 선택하세요.");
    return false;
  }

  if (person === "") {
    alert("인원을 선택하세요.");
    return false;
  }

  if (time === "") {
    alert("시간을 선택하세요.");
    return false;
  }

  if (difficulty === "") {
    alert("난이도를 선택하세요.");
    return false;
  }
  
  if (ingreType === "") {
    alert("재료 유형을 선택하세요.");
    return false;
  }

  const ingredientNames = document.querySelectorAll("input[name^='ingreName']");
  const ingredientMeasures = document.querySelectorAll("input[name^='ingreMeasure']");
  const stepDescriptions = document.querySelectorAll("textarea[name='stepDescription']");

  for (let i = 0; i < ingredientNames.length; i++) {
    if (ingredientNames[i].value === "") {
      alert("재료명을 입력하세요.");
      return false;
    }
  }

  for (let i = 0; i < ingredientMeasures.length; i++) {
    if (ingredientMeasures[i].value === "") {
      alert("재료양을 입력하세요.");
      return false;
    }
  }


  return true;
}
