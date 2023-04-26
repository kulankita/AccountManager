package com.accountmanager.entities;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "income_categories")
public class IncomeCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column
    private int id;
    @Column
    private String name;
    @Column(name="desc")
    private String description;

    @OneToMany(mappedBy = "incomeCategory", cascade = CascadeType.ALL)
    private List<Income> incomes;

    // getters and setters
    
    public IncomeCategory() {
		// TODO Auto-generated constructor stub
	}

	public IncomeCategory(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Income> getIncomes() {
		return incomes;
	}

	public void setIncomes(List<Income> incomes) {
		this.incomes = incomes;
	}

	@Override
	public String toString() {
		return "IncomeCategory [id=" + id + ", name=" + name + ", description=" + description + ", incomes=" + incomes
				+ "]";
	}

	
    
    
}
