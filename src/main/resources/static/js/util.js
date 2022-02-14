import Vue from 'vue';
import axios from '../lib/axios.js';

function getUser() {
    axios.get('/api/user/getUser.do').then((response) =>{

        console.log(response);
        if (response.data.code === 0) {
            return response.data.data;
        } else {
            gotoLogin(response.data.msg,"/login.html");
        }

    }).
    catch((reject) =>{
        console.log(reject)
    });

}