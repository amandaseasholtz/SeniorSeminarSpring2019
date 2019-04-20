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
            </div>
        );
    };
   
}   