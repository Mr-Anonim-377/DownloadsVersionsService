package com.Sales.SalesWeb.model;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

import javax.persistence.*;

import java.math.BigDecimal;

@Entity
@Table(name = "sales")
@ToString(of = {"id", "title","images_id"})
@EqualsAndHashCode(of = {"id"})
//@Builder
public class Sales {

    public void setId(Integer id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setImages_id(BigDecimal images_id) {
        this.images_id = images_id;
    }

    public Integer getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public BigDecimal getImages_id() {
        return images_id;
    }

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name = "title")
    private String title;

    @Column(name = "images_id")
    private BigDecimal images_id;
}
