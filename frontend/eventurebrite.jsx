import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

window.store = configureStore();

document.addEventListener('DOMContentLoaded', () => {
  const store = configureStore();
  const root = document.getElementById('root');
  ReactDOM.render(<h1>Welcome to EventureBrite</h1>, root);
});
