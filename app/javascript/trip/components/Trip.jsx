import React from 'react';
import axios from 'axios';
import PropTypes from 'prop-types'

export default class Catalog extends React.Component {

    state = { trips: [] };

    componentDidMount = () => {
        var self = this;

        axios.defaults.headers.common['X-Requested-With'] = "XMLHttpRequest";
        axios.get('/')
            .then(function (response) {
                console.log(response.data);
                self.setState({ books: response.data })
            })
            .catch(function (error) {
                console.log(error);
            });
    };  

    render = () => {
        return(
            <div>
                <h3>
                    There are {this.state.trips.length} books in the catalog.
                </h3>
                <input placeholder = 'Name' />
                <input placeholder = 'Destination' />
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