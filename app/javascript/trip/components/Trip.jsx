import React from 'react';
import axios from 'axios';

import Calendar from 'react-calendar';

export default class Trip extends React.Component {

    state = { 
        name: null, 
        destination: null,
        start_date: null,
        end_date: null,
        purpose: null,
        expected_expenses: null,
        expected_costs: null,
        payment_information: null,
    
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
                        <label>Start Date</label>
                        <Calendar
                            onChange={(start_date) => this.setState({start_date})}
                            value={this.state.start_date}
                        />
                        <label>End Date</label>
                        <Calendar
                            onChange={(end_date) => this.setState({end_date})}
                            value={this.state.end_date}
                        />
                        <label>Purpose</label>
                        <textarea name="textarea" placeholder = 'Purpose' value={this.state.purpose} onChange = {e => this.setState({purpose: e.target.value})}></textarea>
            

                        <select onChange = {e => this.setState({expected_expenses: e.target.value})}>
                            <option value="food">Food</option>
                            <option value="hotel">Hotel</option>
                            <option value="travel">Travel</option>
                        </select> 

                        <label>Price</label>
                        <input 
                            type="text" 
                            placeholder = 'Price' 
                            value={this.state.expected_costs}
                            onChange = {e => this.setState({expected_costs: e.target.value})}
                        />

                        <select onChange = {e => this.setState({payment_information: e.target.value})}>
                            <option value="Dept1">Dept1</option>
                            <option value="Dept2">Dept2</option>
                            <option value="Dept3">Dept3</option>
                        </select> 

                      
                        <button onClick={this.onButtonClick}>
                            Submit Request
                            
                        </button>
                    </form>
                </div>
            </div>
        );
    }; 
}   