import React from 'react';
import axios from 'axios';

import Calendar from 'react-calendar';

export default class Trip extends React.Component {

    state = {
        name: null,
        destination: null,
        start_date: null,
    };

    onButtonClick(event){
        console.log(event.target.value);
    }
    onFormSubmit = (event) => {
        event.preventDefault();
        console.log(this.state);

        // const newOrder = {
        //     name: this.state.name,
        //     address: this.state.address,
        //     email: this.state.email,
        //     pay_type: this.state.pay_type
        // };

        var self = this;
        axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest";
        axios
            .post("/requests", { ...this.state })
            .then(function (response) {
                console.log(response.data);
                //self.props.history.push({
                //    pathname: '/'
               // });
            })
            .catch(function (error) {
                console.log(error.response);
                // alert("Cannot place order: ", error);
                self.setState({ errors: error.response.data })
            });
    }

    render = () => {
        return(
            <div>
                <h3>
                    Request Travel
                </h3>
                <div className="ui container" style={{marginLeft:'40px'}}>
                    <form onSubmit ={this.onFormSubmit} className= "ui form" >
                        <label>Name</label>
                        <input
                            type="text"
                            placeholder = 'Name'
                            value={this.state.name}
                            onChange = {e => this.setState({name: e.target.value})}
                        />
                        <label>Destination</label>
                        <input
                            type="text"
                            placeholder = 'Destination'
                            value={this.state.destination}
                            onChange = {e => this.setState({destination: e.target.value})}
                        />
                        <Calendar
                            onChange={(start_date) => this.setState({start_date})}
                            value={this.state.start_date}
                        />
                        <button onClick={this.onButtonClick}>
                            Submit Request
                        </button>
                    </form>
                </div>
            </div>
        );
    };

    onFormSubmit(event) {
        event.preventDefault();

        const newOrder = {
            name: this.state.name,
            address: this.state.address,
            email: this.state.email,
            pay_type: this.state.pay_type
        };

        var self = this;
        axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest";
        axios
            .post("/requests", { ...newRequests })
            .then(function (response) {
                console.log(response.data);
                self.props.history.push({
                    pathname: '/'
                });
            })
            .catch(function (error) {
                console.log(error.response);
                // alert("Cannot place order: ", error);
                self.setState({ errors: error.response.data })
            });
    }
}
