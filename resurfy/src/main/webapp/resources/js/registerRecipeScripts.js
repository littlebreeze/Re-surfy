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





    
    //과정 이미지 업로드
    
$(document).ready(function(){
			//등록 버튼
			$(".save").click(function(){
				var recipeName=$("#recipeName").val();
				var recipeDescription=$("#recipeDescription").val();
				var image=$("#mainImage").val();
				var foodType=$("#foodType").val();
				var difficulty=$("#difficulty").val();
				var person=$("#person").val();
				var time=$("#time").val();
				var ingreName=$("#ingreName").val();
				var ingreType=$("#ingreType").val();
				var ingreMeasure=$("#ingreMeasure").val();
				var stepDescription=$("#stepDescription").val();
				if(recipeName == ""){
					  alert("레시피 명을 입력하세요");
					  $("#recipeName").focus(); //입력포커스 이동

					  return; //함수 종료
					}
				if(recipeDescription == ""){
					  alert("요리소개를 입력하세요");
					  $("#recipeDescription").focus(); //입력포커스 이동

					  return; //함수 종료
					}
				if(image == ""){
					  alert("메인 이미지를 입력하세요");
					  $("#image").focus(); //입력포커스 이동

					  return; //함수 종료
					}
				if(difficulty == ""){
					  alert("난이도를 입력하세요");
					  $("#difficulty").focus(); //입력포커스 이동

					  return; //함수 종료
					}
				if(person == ""){
				  alert("인원을 입력하세요");
				  $("#person").focus(); //입력포커스 이동
				  return; //함수 종료
				}
				if(time == ""){
				  alert("시간을 입력하세요");
				  $("#time").focus(); //입력포커스 이동
				  return; //함수 종료
				}
				if(ingreName == ""){
				  alert("재료명을 입력하세요");
				  $("#ingreName").focus(); //입력포커스 이동
				  return; //함수 종료
				}
				if(ingreType == ""){
				  alert("재료타입을 입력하세요");
				  $("#ingreType").focus(); //입력포커스 이동
				  return; //함수 종료
				}
				if(ingreMeasure == ""){
				  alert("재료양을 입력하세요");
				  $("#ingreMeasure").focus(); //입력포커스 이동
				  return; //함수 종료
				}
				if(stepDescription == ""){
				  alert("과정을 입력하세요");
				  $("#stepDescription_").focus(); //입력포커스 이동
				  return; //함수 종료
				}
				$("#registerRecipe").attr("action", "/recipe/registerRecipe");
				$("#registerRecipe").submit();
				alert( "레시피가 등록되었습니다.");
				
			});
		});