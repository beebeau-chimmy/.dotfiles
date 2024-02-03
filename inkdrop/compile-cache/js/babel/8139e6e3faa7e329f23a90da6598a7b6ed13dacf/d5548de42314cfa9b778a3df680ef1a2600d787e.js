"use strict";
'use babel';

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = void 0;
var _react = _interopRequireWildcard(require("react"));
var _inkdrop = require("inkdrop");
function _getRequireWildcardCache(nodeInterop) { if (typeof WeakMap !== "function") return null; var cacheBabelInterop = new WeakMap(); var cacheNodeInterop = new WeakMap(); return (_getRequireWildcardCache = function (nodeInterop) { return nodeInterop ? cacheNodeInterop : cacheBabelInterop; })(nodeInterop); }
function _interopRequireWildcard(obj, nodeInterop) { if (!nodeInterop && obj && obj.__esModule) { return obj; } if (obj === null || typeof obj !== "object" && typeof obj !== "function") { return { default: obj }; } var cache = _getRequireWildcardCache(nodeInterop); if (cache && cache.has(obj)) { return cache.get(obj); } var newObj = {}; var hasPropertyDescriptor = Object.defineProperty && Object.getOwnPropertyDescriptor; for (var key in obj) { if (key !== "default" && Object.prototype.hasOwnProperty.call(obj, key)) { var desc = hasPropertyDescriptor ? Object.getOwnPropertyDescriptor(obj, key) : null; if (desc && (desc.get || desc.set)) { Object.defineProperty(newObj, key, desc); } else { newObj[key] = obj[key]; } } } newObj.default = obj; if (cache) { cache.set(obj, newObj); } return newObj; }
function _extends() { _extends = Object.assign ? Object.assign.bind() : function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; }; return _extends.apply(this, arguments); }
const ImportHTMLSelectNotebookDialog = _props => {
  const {
    NotebookListBar
  } = inkdrop.components.classes;
  const modal = (0, _inkdrop.useModal)();
  const {
    Dialog
  } = inkdrop.components.classes;
  const showDialog = (0, _react.useCallback)(() => {
    modal.show();
  }, []);
  const importHTMLFile = (0, _react.useCallback)(async destBookId => {
    const {
      openImportDialog,
      importHTMLFromMultipleFiles
    } = require('./importer');
    const {
      filePaths
    } = await openImportDialog();
    if (filePaths) {
      modal.close();
      await importHTMLFromMultipleFiles(filePaths, destBookId);
    } else {
      return false;
    }
  }, []);
  const handleNotebookSelect = (0, _react.useCallback)(bookId => {
    importHTMLFile(bookId);
  }, [importHTMLFile]);
  (0, _react.useEffect)(() => {
    const sub = inkdrop.commands.add(document.body, {
      'import-html:import-from-file': showDialog
    });
    return () => sub.dispose();
  }, [showDialog]);
  return /*#__PURE__*/_react.default.createElement(Dialog, _extends({}, modal.state, {
    onBackdropClick: modal.close,
    className: "import-html-select-notebook-dialog"
  }), /*#__PURE__*/_react.default.createElement(Dialog.Title, null, "Import Notes from HTML"), /*#__PURE__*/_react.default.createElement(Dialog.Content, null, /*#__PURE__*/_react.default.createElement("div", {
    className: "ui message"
  }, "Please select a notebook"), /*#__PURE__*/_react.default.createElement("div", {
    className: "ui form"
  }, /*#__PURE__*/_react.default.createElement("div", {
    className: "field"
  }, /*#__PURE__*/_react.default.createElement(NotebookListBar, {
    onItemSelect: handleNotebookSelect
  })))), /*#__PURE__*/_react.default.createElement(Dialog.Actions, {
    className: "right aligned"
  }, /*#__PURE__*/_react.default.createElement("button", {
    className: "ui button",
    onClick: modal.close
  }, "Cancel")));
};
var _default = ImportHTMLSelectNotebookDialog;
exports.default = _default;
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJuYW1lcyI6WyJPYmplY3QiLCJkZWZpbmVQcm9wZXJ0eSIsImV4cG9ydHMiLCJ2YWx1ZSIsImRlZmF1bHQiLCJfcmVhY3QiLCJfaW50ZXJvcFJlcXVpcmVXaWxkY2FyZCIsInJlcXVpcmUiLCJfaW5rZHJvcCIsIl9nZXRSZXF1aXJlV2lsZGNhcmRDYWNoZSIsIm5vZGVJbnRlcm9wIiwiV2Vha01hcCIsImNhY2hlQmFiZWxJbnRlcm9wIiwiY2FjaGVOb2RlSW50ZXJvcCIsIm9iaiIsIl9fZXNNb2R1bGUiLCJjYWNoZSIsImhhcyIsImdldCIsIm5ld09iaiIsImhhc1Byb3BlcnR5RGVzY3JpcHRvciIsImdldE93blByb3BlcnR5RGVzY3JpcHRvciIsImtleSIsInByb3RvdHlwZSIsImhhc093blByb3BlcnR5IiwiY2FsbCIsImRlc2MiLCJzZXQiLCJfZXh0ZW5kcyIsImFzc2lnbiIsImJpbmQiLCJ0YXJnZXQiLCJpIiwiYXJndW1lbnRzIiwibGVuZ3RoIiwic291cmNlIiwiYXBwbHkiLCJJbXBvcnRIVE1MU2VsZWN0Tm90ZWJvb2tEaWFsb2ciLCJfcHJvcHMiLCJOb3RlYm9va0xpc3RCYXIiLCJpbmtkcm9wIiwiY29tcG9uZW50cyIsImNsYXNzZXMiLCJtb2RhbCIsInVzZU1vZGFsIiwiRGlhbG9nIiwic2hvd0RpYWxvZyIsInVzZUNhbGxiYWNrIiwic2hvdyIsImltcG9ydEhUTUxGaWxlIiwiZGVzdEJvb2tJZCIsIm9wZW5JbXBvcnREaWFsb2ciLCJpbXBvcnRIVE1MRnJvbU11bHRpcGxlRmlsZXMiLCJmaWxlUGF0aHMiLCJjbG9zZSIsImhhbmRsZU5vdGVib29rU2VsZWN0IiwiYm9va0lkIiwidXNlRWZmZWN0Iiwic3ViIiwiY29tbWFuZHMiLCJhZGQiLCJkb2N1bWVudCIsImJvZHkiLCJkaXNwb3NlIiwiY3JlYXRlRWxlbWVudCIsInN0YXRlIiwib25CYWNrZHJvcENsaWNrIiwiY2xhc3NOYW1lIiwiVGl0bGUiLCJDb250ZW50Iiwib25JdGVtU2VsZWN0IiwiQWN0aW9ucyIsIm9uQ2xpY2siLCJfZGVmYXVsdCJdLCJzb3VyY2VzIjpbInNlbGVjdC1ib29rLWRpYWxvZy5qcyJdLCJzb3VyY2VzQ29udGVudCI6WyIndXNlIGJhYmVsJ1xuXG5pbXBvcnQgUmVhY3QsIHsgdXNlRWZmZWN0LCB1c2VDYWxsYmFjayB9IGZyb20gJ3JlYWN0J1xuaW1wb3J0IHsgdXNlTW9kYWwgfSBmcm9tICdpbmtkcm9wJ1xuXG5jb25zdCBJbXBvcnRIVE1MU2VsZWN0Tm90ZWJvb2tEaWFsb2cgPSBfcHJvcHMgPT4ge1xuICBjb25zdCB7IE5vdGVib29rTGlzdEJhciB9ID0gaW5rZHJvcC5jb21wb25lbnRzLmNsYXNzZXNcbiAgY29uc3QgbW9kYWwgPSB1c2VNb2RhbCgpXG4gIGNvbnN0IHsgRGlhbG9nIH0gPSBpbmtkcm9wLmNvbXBvbmVudHMuY2xhc3Nlc1xuXG4gIGNvbnN0IHNob3dEaWFsb2cgPSB1c2VDYWxsYmFjaygoKSA9PiB7XG4gICAgbW9kYWwuc2hvdygpXG4gIH0sIFtdKVxuXG4gIGNvbnN0IGltcG9ydEhUTUxGaWxlID0gdXNlQ2FsbGJhY2soYXN5bmMgZGVzdEJvb2tJZCA9PiB7XG4gICAgY29uc3Qge1xuICAgICAgb3BlbkltcG9ydERpYWxvZyxcbiAgICAgIGltcG9ydEhUTUxGcm9tTXVsdGlwbGVGaWxlc1xuICAgIH0gPSByZXF1aXJlKCcuL2ltcG9ydGVyJylcbiAgICBjb25zdCB7IGZpbGVQYXRocyB9ID0gYXdhaXQgb3BlbkltcG9ydERpYWxvZygpXG4gICAgaWYgKGZpbGVQYXRocykge1xuICAgICAgbW9kYWwuY2xvc2UoKVxuICAgICAgYXdhaXQgaW1wb3J0SFRNTEZyb21NdWx0aXBsZUZpbGVzKGZpbGVQYXRocywgZGVzdEJvb2tJZClcbiAgICB9IGVsc2Uge1xuICAgICAgcmV0dXJuIGZhbHNlXG4gICAgfVxuICB9LCBbXSlcblxuICBjb25zdCBoYW5kbGVOb3RlYm9va1NlbGVjdCA9IHVzZUNhbGxiYWNrKFxuICAgIGJvb2tJZCA9PiB7XG4gICAgICBpbXBvcnRIVE1MRmlsZShib29rSWQpXG4gICAgfSxcbiAgICBbaW1wb3J0SFRNTEZpbGVdXG4gIClcblxuICB1c2VFZmZlY3QoKCkgPT4ge1xuICAgIGNvbnN0IHN1YiA9IGlua2Ryb3AuY29tbWFuZHMuYWRkKGRvY3VtZW50LmJvZHksIHtcbiAgICAgICdpbXBvcnQtaHRtbDppbXBvcnQtZnJvbS1maWxlJzogc2hvd0RpYWxvZ1xuICAgIH0pXG4gICAgcmV0dXJuICgpID0+IHN1Yi5kaXNwb3NlKClcbiAgfSwgW3Nob3dEaWFsb2ddKVxuXG4gIHJldHVybiAoXG4gICAgPERpYWxvZ1xuICAgICAgey4uLm1vZGFsLnN0YXRlfVxuICAgICAgb25CYWNrZHJvcENsaWNrPXttb2RhbC5jbG9zZX1cbiAgICAgIGNsYXNzTmFtZT1cImltcG9ydC1odG1sLXNlbGVjdC1ub3RlYm9vay1kaWFsb2dcIlxuICAgID5cbiAgICAgIDxEaWFsb2cuVGl0bGU+SW1wb3J0IE5vdGVzIGZyb20gSFRNTDwvRGlhbG9nLlRpdGxlPlxuICAgICAgPERpYWxvZy5Db250ZW50PlxuICAgICAgICA8ZGl2IGNsYXNzTmFtZT1cInVpIG1lc3NhZ2VcIj5QbGVhc2Ugc2VsZWN0IGEgbm90ZWJvb2s8L2Rpdj5cbiAgICAgICAgPGRpdiBjbGFzc05hbWU9XCJ1aSBmb3JtXCI+XG4gICAgICAgICAgPGRpdiBjbGFzc05hbWU9XCJmaWVsZFwiPlxuICAgICAgICAgICAgPE5vdGVib29rTGlzdEJhciBvbkl0ZW1TZWxlY3Q9e2hhbmRsZU5vdGVib29rU2VsZWN0fSAvPlxuICAgICAgICAgIDwvZGl2PlxuICAgICAgICA8L2Rpdj5cbiAgICAgIDwvRGlhbG9nLkNvbnRlbnQ+XG4gICAgICA8RGlhbG9nLkFjdGlvbnMgY2xhc3NOYW1lPVwicmlnaHQgYWxpZ25lZFwiPlxuICAgICAgICA8YnV0dG9uIGNsYXNzTmFtZT1cInVpIGJ1dHRvblwiIG9uQ2xpY2s9e21vZGFsLmNsb3NlfT5cbiAgICAgICAgICBDYW5jZWxcbiAgICAgICAgPC9idXR0b24+XG4gICAgICA8L0RpYWxvZy5BY3Rpb25zPlxuICAgIDwvRGlhbG9nPlxuICApXG59XG5cbmV4cG9ydCBkZWZhdWx0IEltcG9ydEhUTUxTZWxlY3ROb3RlYm9va0RpYWxvZ1xuIl0sIm1hcHBpbmdzIjoiO0FBQUEsV0FBVzs7QUFBQUEsTUFBQSxDQUFBQyxjQUFBLENBQUFDLE9BQUE7RUFBQUMsS0FBQTtBQUFBO0FBQUFELE9BQUEsQ0FBQUUsT0FBQTtBQUVYLElBQUFDLE1BQUEsR0FBQUMsdUJBQUEsQ0FBQUMsT0FBQTtBQUNBLElBQUFDLFFBQUEsR0FBQUQsT0FBQTtBQUFrQyxTQUFBRSx5QkFBQUMsV0FBQSxlQUFBQyxPQUFBLGtDQUFBQyxpQkFBQSxPQUFBRCxPQUFBLFFBQUFFLGdCQUFBLE9BQUFGLE9BQUEsWUFBQUYsd0JBQUEsWUFBQUEsQ0FBQUMsV0FBQSxXQUFBQSxXQUFBLEdBQUFHLGdCQUFBLEdBQUFELGlCQUFBLEtBQUFGLFdBQUE7QUFBQSxTQUFBSix3QkFBQVEsR0FBQSxFQUFBSixXQUFBLFNBQUFBLFdBQUEsSUFBQUksR0FBQSxJQUFBQSxHQUFBLENBQUFDLFVBQUEsV0FBQUQsR0FBQSxRQUFBQSxHQUFBLG9CQUFBQSxHQUFBLHdCQUFBQSxHQUFBLDRCQUFBVixPQUFBLEVBQUFVLEdBQUEsVUFBQUUsS0FBQSxHQUFBUCx3QkFBQSxDQUFBQyxXQUFBLE9BQUFNLEtBQUEsSUFBQUEsS0FBQSxDQUFBQyxHQUFBLENBQUFILEdBQUEsWUFBQUUsS0FBQSxDQUFBRSxHQUFBLENBQUFKLEdBQUEsU0FBQUssTUFBQSxXQUFBQyxxQkFBQSxHQUFBcEIsTUFBQSxDQUFBQyxjQUFBLElBQUFELE1BQUEsQ0FBQXFCLHdCQUFBLFdBQUFDLEdBQUEsSUFBQVIsR0FBQSxRQUFBUSxHQUFBLGtCQUFBdEIsTUFBQSxDQUFBdUIsU0FBQSxDQUFBQyxjQUFBLENBQUFDLElBQUEsQ0FBQVgsR0FBQSxFQUFBUSxHQUFBLFNBQUFJLElBQUEsR0FBQU4scUJBQUEsR0FBQXBCLE1BQUEsQ0FBQXFCLHdCQUFBLENBQUFQLEdB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