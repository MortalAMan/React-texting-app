import axios from 'axios';

export const addMessage = (message) => {
  return {
    type: 'ADD_MESSAGE',
    message
  }
}

export const fetchMessages = () => {
  return(dispatch) => {
    axios.get('/api/messages')
      .then( res => {
        dispatch({ type: 'SET_MESSAGES', messages: res.data });
      })
      .catch( error => {
        console.log(error);
    });
  }
}