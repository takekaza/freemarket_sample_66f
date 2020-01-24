$(document).on('turbolinks:load', ()=> {

  const buildFileField = (index)=>{
    const html =`<div data-index="${index}" class="js-file_group">
                    <input class="upload__image--icon" type="file"
                    name="item[images_attributes][${index}][url]"
                    id="item_images_attributes_${index}_url"><br>
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;

  }
  const buildImg = (index,url)=>{
    const html =`<img data-index="${index}" src="${url}" width="100px" height=""100px>`;
    return html;
  }
  let fileIndex =[1,2,3,4,5,6,7,8,9,10];

// 値が変わると変数htmlが追加されindexの値が１増える

  $('.upload__image').on('change','.upload__image--icon', function(e){
    // $('.upload__image').append(buildFileField(fileIndex[0]));
    // fileIndex.shift();
    // fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    const targetIndex =$(this).parent().data('index');
    const file =e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('url', blobUrl);
    }else{
      $('.previews').append(buildImg(targetIndex,blobUrl));
      $('.upload__image').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1)

    }
  });
  
  $('.upload__image').on('click','.js-remove',function(){
    $(this).parent().remove();
    if ($('.upload__image--icon').length == 0)　$ ('.upload__image').append(buildFileField(fileIndex[0]));
    $(`img[data-index="${targetIndex}"]`).remove();
  });
});
