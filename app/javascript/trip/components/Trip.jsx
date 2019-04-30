import React from 'react';
import axios from 'axios';
import ExpenseGroup from './ExpenseGroup';

import Calendar from 'react-calendar';


const expenseTemplate = {
    expected_costs: 0,
    expected_expenses: 'food',
    payment_informations: 'Dept1',
}

export default class Trip extends React.Component {

    state = {
        id: null,
        name: null,
        destination: null,
        start_date: null,
        expenseGroups: [{...expenseTemplate}],
    };

    routeChange() {
        let path = `homepage/index`;
        this.props.history.push(path);
    }

    onFormSubmit = (event) => {
        event.preventDefault();
        console.log('State:', this.state);

        const { expenseGroups } = this.state;
        
        axios.defaults.headers.common["X-Requested-With"] = "XMLHttpRequest";
        axios
            .post("/requests", { ...this.state })
            .then( response => { //then -- waits for other previous to finish
                console.log(response.data);
                const { id } = response.data;
                
                for (var i =0; i<this.state.expenseGroups.length; i++){
                    const expenseGroup = {
                        id: this.state.id,
                        expected_costs: this.state.expected_costs,
                        expected_expenses: this.state.expected_expenses,
                        payment_informations: this.state.payment_informations,
                    }
                    
                   
                        console.log({...expenseGroups})
                        axios.post("/expected_expenses/", {...expenseGroups}) 
                        axios.post("/expected_expenses/", { expense: expense.expected_expenses, request_id: id })
                        axios.post("/expected_costs", { cost: expense.expected_costs, request_id: id })
                    // axios.post("/expected_costs", { cost: expense.expected_costs, request_id: id })
                }
                })
                .catch(error => console.log('Error:', error.response));

          
        //  axios
        //      .post("/requests", { ...this.state })
        //       expenseGroups.forEach 
        //      .post("/expected_costs", { ...this.state })
        //      .post("/expected_expenses", { ...this.state })
        //      .post("/payment_informations", { ...this.state })
        //      .then(function (response) {
        //          console.log(response.data);
        //          //self.props.history.push({
        //          //    pathname: '/'
        //          // });
        //      })
        //      .catch(function (error) {
        //          console.log(error.response);
        //          // alert("Cannot place order: ", error);
        //          self.setState({ errors: error.response.data })
        //      });
    }

    addExpense = (e) => {
        e.preventDefault();
        const newExpenseGroups = [...this.state.expenseGroups];
        newExpenseGroups.push({...expenseTemplate});
        this.setState({ ...this.state, expenseGroups: newExpenseGroups })
    }

    handleItemChange = (index, path, newValue) => {
        const newExpenses = [...this.state.expenseGroups];
        const newExpense = newExpenses[index];
        newExpense[path] = newValue;
        this.setState({...this.state, expenseGroups: newExpenses})
    }

    render = () => {
        const { expenseGroups } = this.state;
        return (
            <div>
                <h3>
                    Request Travel
                </h3>
                <div className="ui container" style={{ marginLeft: '40px' }}>
                    <label>Name</label>
                    <input
                        type="text"
                        placeholder='Name'
                        value={this.state.name}
                        onChange={e => this.setState({ name: e.target.value })}
                    />
                    <label>Destination</label>
                    <input
                        type="text"
                        placeholder='Destination'
                        value={this.state.destination}
                        onChange={e => this.setState({ destination: e.target.value })}
                    />
                    <label>Start Date</label>
                    <Calendar
                        onChange={(start_date) => this.setState({ start_date })}
                        value={this.state.start_date}
                    />
                    <label>End Date</label>
                    <Calendar
                        onChange={(end_date) => this.setState({ end_date })}
                        value={this.state.end_date}
                    />
                    <label>Purpose</label>
                    <textarea name="textarea" placeholder='Purpose' value={this.state.purpose} onChange={e => this.setState({ purpose: e.target.value })}></textarea>

                    {
                        this.state.expenseGroups.map((expenseGroup, i) => {
                            return (
                                <div style={{ backgroundColor: '#f0f8ff', marginBottom: 10, borderRadius: 5 }} key={i}>
                                    <ExpenseGroup
                                        index={i}
                                        onItemChange={this.handleItemChange}
                                        expected_costs={expenseGroup.expected_costs}
                                        expected_expenses={expenseGroup.expected_expenses}
                                        payment_informations={expenseGroup.payment_informations}
                                    />
                                </div>
                            )
                        })
                    }

                    <div style={{ display: 'flex', flexDirection: 'column', alignItems: 'start' }}>
                        <button onClick={this.addExpense}>Add another expense</button>
                        <button onClick={this.onFormSubmit}>
                            Submit Request
                        </button>
                    </div>
                </div>
            </div>
        );
    };
}
