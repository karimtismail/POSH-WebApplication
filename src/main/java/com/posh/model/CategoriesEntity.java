package com.posh.model;

import jakarta.persistence.*;

@Entity
@Table(name = "categories", schema = "posh", catalog = "")
public class CategoriesEntity {
    private int id;
    private Integer liquidId;
    private Integer oilId;
    private Integer batteriesId;
    private Integer plugsId;
    private Integer tiersId;
    private LiquidCategoryEntity liquidCategoryByLiquidId;
    private OilCategoryEntity oilCategoryByOilId;
    private BatteriesCategoryEntity batteriesCategoryByBatteriesId;
    private PlugsCategoryEntity plugsCategoryByPlugsId;
    private TiresCategoryEntity tiresCategoryByTiersId;

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "liquid_id", nullable = true)
    public Integer getLiquidId() {
        return liquidId;
    }

    public void setLiquidId(Integer liquidId) {
        this.liquidId = liquidId;
    }

    @Basic
    @Column(name = "oil_id", nullable = true)
    public Integer getOilId() {
        return oilId;
    }

    public void setOilId(Integer oilId) {
        this.oilId = oilId;
    }

    @Basic
    @Column(name = "batteries_id", nullable = true)
    public Integer getBatteriesId() {
        return batteriesId;
    }

    public void setBatteriesId(Integer batteriesId) {
        this.batteriesId = batteriesId;
    }

    @Basic
    @Column(name = "plugs_id", nullable = true)
    public Integer getPlugsId() {
        return plugsId;
    }

    public void setPlugsId(Integer plugsId) {
        this.plugsId = plugsId;
    }

    @Basic
    @Column(name = "tiers_id", nullable = true)
    public Integer getTiersId() {
        return tiersId;
    }

    public void setTiersId(Integer tiersId) {
        this.tiersId = tiersId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CategoriesEntity that = (CategoriesEntity) o;

        if (id != that.id) return false;
        if (liquidId != null ? !liquidId.equals(that.liquidId) : that.liquidId != null) return false;
        if (oilId != null ? !oilId.equals(that.oilId) : that.oilId != null) return false;
        if (batteriesId != null ? !batteriesId.equals(that.batteriesId) : that.batteriesId != null) return false;
        if (plugsId != null ? !plugsId.equals(that.plugsId) : that.plugsId != null) return false;
        if (tiersId != null ? !tiersId.equals(that.tiersId) : that.tiersId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (liquidId != null ? liquidId.hashCode() : 0);
        result = 31 * result + (oilId != null ? oilId.hashCode() : 0);
        result = 31 * result + (batteriesId != null ? batteriesId.hashCode() : 0);
        result = 31 * result + (plugsId != null ? plugsId.hashCode() : 0);
        result = 31 * result + (tiersId != null ? tiersId.hashCode() : 0);
        return result;
    }

    @ManyToOne
    @JoinColumn(name = "liquid_id", referencedColumnName = "id")
    public LiquidCategoryEntity getLiquidCategoryByLiquidId() {
        return liquidCategoryByLiquidId;
    }

    public void setLiquidCategoryByLiquidId(LiquidCategoryEntity liquidCategoryByLiquidId) {
        this.liquidCategoryByLiquidId = liquidCategoryByLiquidId;
    }

    @ManyToOne
    @JoinColumn(name = "oil_id", referencedColumnName = "id")
    public OilCategoryEntity getOilCategoryByOilId() {
        return oilCategoryByOilId;
    }

    public void setOilCategoryByOilId(OilCategoryEntity oilCategoryByOilId) {
        this.oilCategoryByOilId = oilCategoryByOilId;
    }

    @ManyToOne
    @JoinColumn(name = "batteries_id", referencedColumnName = "id")
    public BatteriesCategoryEntity getBatteriesCategoryByBatteriesId() {
        return batteriesCategoryByBatteriesId;
    }

    public void setBatteriesCategoryByBatteriesId(BatteriesCategoryEntity batteriesCategoryByBatteriesId) {
        this.batteriesCategoryByBatteriesId = batteriesCategoryByBatteriesId;
    }

    @ManyToOne
    @JoinColumn(name = "plugs_id", referencedColumnName = "id")
    public PlugsCategoryEntity getPlugsCategoryByPlugsId() {
        return plugsCategoryByPlugsId;
    }

    public void setPlugsCategoryByPlugsId(PlugsCategoryEntity plugsCategoryByPlugsId) {
        this.plugsCategoryByPlugsId = plugsCategoryByPlugsId;
    }

    @ManyToOne
    @JoinColumn(name = "tiers_id", referencedColumnName = "id")
    public TiresCategoryEntity getTiresCategoryByTiersId() {
        return tiresCategoryByTiersId;
    }

    public void setTiresCategoryByTiersId(TiresCategoryEntity tiresCategoryByTiersId) {
        this.tiresCategoryByTiersId = tiresCategoryByTiersId;
    }
}
