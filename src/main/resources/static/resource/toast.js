const Editor = toastui.Editor;

window.dataStorage = {
    _storage: new WeakMap(),
    put: function (element, key, obj) {
        if (!this._storage.has(element)) {
            this._storage.set(element, new Map());
        }
        this._storage.get(element).set(key, obj);
    },
    get: function (element, key) {
        return this._storage.get(element).get(key);
    },
    has: function (element, key) {
        return this._storage.has(element) && this._storage.get(element).has(key);
    },
    remove: function (element, key) {
        var ret = this._storage.get(element).delete(key);
        if (!this._storage.get(element).size === 0) {
            this._storage.delete(element);
        }
        return ret;
    }
}

function Editor__init(){
  const editorEl = document.querySelector('#editor');
  const editor = new Editor({
    el: editorEl,
    height: '500px',
    initialEditType: 'markdown',
    previewStyle: 'tab'
  });
  
  dataStorage.put(editorEl, 'editor', editor);
  
}


const btnGetHtmlEl = document.querySelector('#btn-getHtml');
var body='';
btnGetHtmlEl.addEventListener('click', () => {
  const editorEl = document.querySelector('#editor');
  const editor = dataStorage.get(editorEl, 'editor');
  body = editor.getMarkdown();
//  alert(editor.getHTML());
  
})

function body_iput() {
   
  $('input[name=body]').attr('value',body);
	
}
 
Editor__init();
