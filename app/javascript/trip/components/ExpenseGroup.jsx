import React, { Component } from 'react'

export default class ExpenseGroup extends Component {
  render() {
    const {expected_costs, expected_expenses, payment_informations, onItemChange, index} = this.props;
    return (
      <div>
        <label>Expenses:</label>
        <label>Type</label>
        <select value={expected_expenses} onChange={(e) => onItemChange(index, 'expected_expenses', e.target.value)}>
          <option value="food">Food</option>
          <option value="hotel">Hotel</option>
          <option value="travel">Travel</option>
        </select>

        <label>Est. Price</label>
        <input
          type="text"
          placeholder='Est. Price'
          value={expected_costs}
          onChange={(e) => onItemChange(index, 'expected_costs', e.target.value)}
        />
        <label>Department to Pay</label>
        <select value={payment_informations} onChange={(e) => onItemChange(index, 'payment_informations', e.target.value)}>
          <option value="Dept1">Dept1</option>
          <option value="Dept2">Dept2</option>
          <option value="Dept3">Dept3</option>
        </select>
      </div>
    )
  }
}
