// このローカルアプリ専用の利用者。外部の認証サービスは使用しない。
window.localProfile = Object.freeze({
  currentUser: Object.freeze({uid: "local-user", displayName: "ローカルユーザー", email: "local@localhost"}),
  onReady(callback) {
    const notify = () => callback(this.currentUser);
    if (document.readyState === "loading") {
      document.addEventListener("DOMContentLoaded", notify, {once: true});
    } else {
      queueMicrotask(notify);
    }
  }
});
