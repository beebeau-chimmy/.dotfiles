"use strict";
"use babel";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;
var React = _interopRequireWildcard(require("react"));
var _eventKit = require("event-kit");
var _inkdrop = require("inkdrop");
var _linkFormatReplace = require("./link-format-replace");
function _getRequireWildcardCache(nodeInterop) { if (typeof WeakMap !== "function") return null; var cacheBabelInterop = new WeakMap(); var cacheNodeInterop = new WeakMap(); return (_getRequireWildcardCache = function (nodeInterop) { return nodeInterop ? cacheNodeInterop : cacheBabelInterop; })(nodeInterop); }
function _interopRequireWildcard(obj, nodeInterop) { if (!nodeInterop && obj && obj.__esModule) { return obj; } if (obj === null || typeof obj !== "object" && typeof obj !== "function") { return { default: obj }; } var cache = _getRequireWildcardCache(nodeInterop); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (key !== "default" && Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj.default = obj; if (cache) { cache.set(obj, newObj); } return newObj; }
class LinkFormatMessageDialog extends React.Component {
  componentWillMount() {
    // Events subscribed to in Inkdrop's system can be easily cleaned up with a CompositeDisposable
    this.subscriptions = new _eventKit.CompositeDisposable();

    // Register command that toggles this dialog
    this.subscriptions.add(inkdrop.commands.add(document.body, {
      "link-format:replace": () => this.replaceLinkFormat()
    }));
  }
  componentWillUnmount() {
    this.subscriptions.dispose();
  }
  render() {
    const MessageDialog = inkdrop.components.getComponentClass("MessageDialog");
    return /*#__PURE__*/React.createElement(MessageDialog, {
      ref: el => this.dialogRef = el,
      title: "LinkFormat",
      buttons: [],
      modalSettings: {
        closable: false
      }
    }, /*#__PURE__*/React.createElement("p", {
      className: "link-format dialog"
    }, "Fetching And Replacing!!"));
  }
  replaceLinkFormat() {
    const dialog = this.dialogRef;
    if (dialog.isShown) {
      dialog.dismissDialog();
    }
    dialog.showDialog();
    (async function () {
      const editor = inkdrop.getActiveEditor();
      const {
        cm
      } = editor;
      let text = cm.getSelection();
      if (text) {
        // selected text
        text = await (0, _linkFormatReplace.fetchAndReplaceText)(text);
        cm.replaceSelection(text);
      } else {
        // all text
        const {
          editingNote
        } = inkdrop.store.getState();
        if (!editingNote) {
          return;
        }
        const {
          body
        } = editingNote;
        text = await (0, _linkFormatReplace.fetchAndReplaceText)(body.toString());
        inkdrop.store.dispatch(_inkdrop.actions.editingNote.update({
          body: text
        }));
      }
      dialog.dismissDialog();
    })();
  }
}
exports.default = LinkFormatMessageDialog;
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJuYW1lcyI6WyJPYmplY3QiLCJkZWZpbmVQcm9wZXJ0eSIsImV4cG9ydHMiLCJ2YWx1ZSIsImRlZmF1bHQiLCJSZWFjdCIsIl9pbnRlcm9wUmVxdWlyZVdpbGRjYXJkIiwicmVxdWlyZSIsIl9ldmVudEtpdCIsIl9pbmtkcm9wIiwiX2xpbmtGb3JtYXRSZXBsYWNlIiwiX2dldFJlcXVpcmVXaWxkY2FyZENhY2hlIiwibm9kZUludGVyb3AiLCJXZWFrTWFwIiwiY2FjaGVCYWJlbEludGVyb3AiLCJjYWNoZU5vZGVJbnRlcm9wIiwib2JqIiwiX19lc01vZHVsZSIsImNhY2hlIiwiaGFzIiwiZ2V0IiwibmV3T2JqIiwiaGFzUHJvcGVydHlEZXNjcmlwdG9yIiwiZ2V0T3duUHJvcGVydHlEZXNjcmlwdG9yIiwia2V5IiwicHJvdG90eXBlIiwiaGFzT3duUHJvcGVydHkiLCJjYWxsIiwiZGVzYyIsInNldCIsIkxpbmtGb3JtYXRNZXNzYWdlRGlhbG9nIiwiQ29tcG9uZW50IiwiY29tcG9uZW50V2lsbE1vdW50Iiwic3Vic2NyaXB0aW9ucyIsIkNvbXBvc2l0ZURpc3Bvc2FibGUiLCJhZGQiLCJpbmtkcm9wIiwiY29tbWFuZHMiLCJkb2N1bWVudCIsImJvZHkiLCJsaW5rLWZvcm1hdDpyZXBsYWNlIiwicmVwbGFjZUxpbmtGb3JtYXQiLCJjb21wb25lbnRXaWxsVW5tb3VudCIsImRpc3Bvc2UiLCJyZW5kZXIiLCJNZXNzYWdlRGlhbG9nIiwiY29tcG9uZW50cyIsImdldENvbXBvbmVudENsYXNzIiwiY3JlYXRlRWxlbWVudCIsInJlZiIsImVsIiwiZGlhbG9nUmVmIiwidGl0bGUiLCJidXR0b25zIiwibW9kYWxTZXR0aW5ncyIsImNsb3NhYmxlIiwiY2xhc3NOYW1lIiwiZGlhbG9nIiwiaXNTaG93biIsImRpc21pc3NEaWFsb2ciLCJzaG93RGlhbG9nIiwiZWRpdG9yIiwiZ2V0QWN0aXZlRWRpdG9yIiwiY20iLCJ0ZXh0IiwiZ2V0U2VsZWN0aW9uIiwiZmV0Y2hBbmRSZXBsYWNlVGV4dCIsInJlcGxhY2VTZWxlY3Rpb24iLCJlZGl0aW5nTm90ZSIsInN0b3JlIiwiZ2V0U3RhdGUiLCJ0b1N0cmluZyIsImRpc3BhdGNoIiwiYWN0aW9ucyIsInVwZGF0ZSJdLCJzb3VyY2VzIjpbImxpbmstZm9ybWF0LW1lc3NhZ2UtZGlhbG9nLmpzIl0sInNvdXJjZXNDb250ZW50IjpbIlwidXNlIGJhYmVsXCI7XG5cbmltcG9ydCAqIGFzIFJlYWN0IGZyb20gXCJyZWFjdFwiO1xuaW1wb3J0IHsgQ29tcG9zaXRlRGlzcG9zYWJsZSB9IGZyb20gXCJldmVudC1raXRcIjtcbmltcG9ydCB7IGFjdGlvbnMgfSBmcm9tIFwiaW5rZHJvcFwiO1xuaW1wb3J0IHsgZmV0Y2hBbmRSZXBsYWNlVGV4dCB9IGZyb20gXCIuL2xpbmstZm9ybWF0LXJlcGxhY2VcIjtcblxuZXhwb3J0IGRlZmF1bHQgY2xhc3MgTGlua0Zvcm1hdE1lc3NhZ2VEaWFsb2cgZXh0ZW5kcyBSZWFjdC5Db21wb25lbnQge1xuICBjb21wb25lbnRXaWxsTW91bnQoKSB7XG4gICAgLy8gRXZlbnRzIHN1YnNjcmliZWQgdG8gaW4gSW5rZHJvcCdzIHN5c3RlbSBjYW4gYmUgZWFzaWx5IGNsZWFuZWQgdXAgd2l0aCBhIENvbXBvc2l0ZURpc3Bvc2FibGVcbiAgICB0aGlzLnN1YnNjcmlwdGlvbnMgPSBuZXcgQ29tcG9zaXRlRGlzcG9zYWJsZSgpO1xuXG4gICAgLy8gUmVnaXN0ZXIgY29tbWFuZCB0aGF0IHRvZ2dsZXMgdGhpcyBkaWFsb2dcbiAgICB0aGlzLnN1YnNjcmlwdGlvbnMuYWRkKFxuICAgICAgaW5rZHJvcC5jb21tYW5kcy5hZGQoZG9jdW1lbnQuYm9keSwge1xuICAgICAgICBcImxpbmstZm9ybWF0OnJlcGxhY2VcIjogKCkgPT4gdGhpcy5yZXBsYWNlTGlua0Zvcm1hdCgpLFxuICAgICAgfSlcbiAgICApO1xuICB9XG5cbiAgY29tcG9uZW50V2lsbFVubW91bnQoKSB7XG4gICAgdGhpcy5zdWJzY3JpcHRpb25zLmRpc3Bvc2UoKTtcbiAgfVxuXG4gIHJlbmRlcigpIHtcbiAgICBjb25zdCBNZXNzYWdlRGlhbG9nID0gaW5rZHJvcC5jb21wb25lbnRzLmdldENvbXBvbmVudENsYXNzKFwiTWVzc2FnZURpYWxvZ1wiKTtcbiAgICByZXR1cm4gKFxuICAgICAgPE1lc3NhZ2VEaWFsb2dcbiAgICAgICAgcmVmPXsoZWwpID0+ICh0aGlzLmRpYWxvZ1JlZiA9IGVsKX1cbiAgICAgICAgdGl0bGU9XCJMaW5rRm9ybWF0XCJcbiAgICAgICAgYnV0dG9ucz17W119XG4gICAgICAgIG1vZGFsU2V0dGluZ3M9e3sgY2xvc2FibGU6IGZhbHNlIH19XG4gICAgICA+XG4gICAgICAgIDxwIGNsYXNzTmFtZT1cImxpbmstZm9ybWF0IGRpYWxvZ1wiPkZldGNoaW5nIEFuZCBSZXBsYWNpbmchITwvcD5cbiAgICAgIDwvTWVzc2FnZURpYWxvZz5cbiAgICApO1xuICB9XG5cbiAgcmVwbGFjZUxpbmtGb3JtYXQoKSB7XG4gICAgY29uc3QgZGlhbG9nID0gdGhpcy5kaWFsb2dSZWY7XG4gICAgaWYgKGRpYWxvZy5pc1Nob3duKSB7XG4gICAgICBkaWFsb2cuZGlzbWlzc0RpYWxvZygpO1xuICAgIH1cbiAgICBkaWFsb2cuc2hvd0RpYWxvZygpO1xuXG4gICAgKGFzeW5jIGZ1bmN0aW9uICgpIHtcbiAgICAgIGNvbnN0IGVkaXRvciA9IGlua2Ryb3AuZ2V0QWN0aXZlRWRpdG9yKCk7XG4gICAgICBjb25zdCB7IGNtIH0gPSBlZGl0b3I7XG4gICAgICBsZXQgdGV4dCA9IGNtLmdldFNlbGVjdGlvbigpO1xuICAgICAgaWYgKHRleHQpIHtcbiAgICAgICAgLy8gc2VsZWN0ZWQgdGV4dFxuICAgICAgICB0ZXh0ID0gYXdhaXQgZmV0Y2hBbmRSZXBsYWNlVGV4dCh0ZXh0KTtcbiAgICAgICAgY20ucmVwbGFjZVNlbGVjdGlvbih0ZXh0KTtcbiAgICAgIH0gZWxzZSB7XG4gICAgICAgIC8vIGFsbCB0ZXh0XG4gICAgICAgIGNvbnN0IHsgZWRpdGluZ05vdGUgfSA9IGlua2Ryb3Auc3RvcmUuZ2V0U3RhdGUoKTtcbiAgICAgICAgaWYgKCFlZGl0aW5nTm90ZSkge1xuICAgICAgICAgIHJldHVybjtcbiAgICAgICAgfVxuICAgICAgICBjb25zdCB7IGJvZHkgfSA9IGVkaXRpbmdOb3RlO1xuICAgICAgICB0ZXh0ID0gYXdhaXQgZmV0Y2hBbmRSZXBsYWNlVGV4dChib2R5LnRvU3RyaW5nKCkpO1xuICAgICAgICBpbmtkcm9wLnN0b3JlLmRpc3BhdGNoKGFjdGlvbnMuZWRpdGluZ05vdGUudXBkYXRlKHsgYm9keTogdGV4dCB9KSk7XG4gICAgICB9XG5cbiAgICAgIGRpYWxvZy5kaXNtaXNzRGlhbG9nKCk7XG4gICAgfSkoKTtcbiAgfVxufVxuIl0sIm1hcHBpbmdzIjoiO0FBQUEsV0FBVzs7QUFBQ0EsTUFBQSxDQUFBQyxjQUFBLENBQUFDLE9BQUE7RUFBQUMsS0FBQTtBQUFBO0FBQUFELE9BQUEsQ0FBQUUsT0FBQTtBQUVaLElBQUFDLEtBQUEsR0FBQUMsdUJBQUEsQ0FBQUMsT0FBQTtBQUNBLElBQUFDLFNBQUEsR0FBQUQsT0FBQTtBQUNBLElBQUFFLFFBQUEsR0FBQUYsT0FBQTtBQUNBLElBQUFHLGtCQUFBLEdBQUFILE9BQUE7QUFBNEQsU0FBQUkseUJBQUFDLFdBQUEsZUFBQUMsT0FBQSxrQ0FBQUMsaUJBQUEsT0FBQUQsT0FBQSxRQUFBRSxnQkFBQSxPQUFBRixPQUFBLFlBQUFGLHdCQUFBLFlBQUFBLENBQUFDLFdBQUEsV0FBQUEsV0FBQSxHQUFBRyxnQkFBQSxHQUFBRCxpQkFBQSxLQUFBRixXQUFBO0FBQUEsU0FBQU4sd0JBQUFVLEdBQUEsRUFBQUosV0FBQSxTQUFBQSxXQUFBLElBQUFJLEdBQUEsSUFBQUEsR0FBQSxDQUFBQyxVQUFBLFdBQUFELEdBQUEsUUFBQUEsR0FBQSxvQkFBQUEsR0FBQSx3QkFBQUEsR0FBQSw0QkFBQVosT0FBQSxFQUFBWSxHQUFBLFVBQUFFLEtBQUEsR0FBQVAsd0JBQUEsQ0FBQUMsV0FBQSxPQUFBTSxLQUFBLElBQUFBLEtB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