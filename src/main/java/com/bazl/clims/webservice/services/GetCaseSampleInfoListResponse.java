
package com.bazl.clims.webservice.services;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>anonymous complex type的 Java 类。
 * 
 * <p>以下模式片段指定包含在此类中的预期内容。
 * 
 * <pre>
 * &lt;complexType&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="out" type="{http://domain.lims.viathink.com}ArrayOfSampleInfo"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "out"
})
@XmlRootElement(name = "getCaseSampleInfoListResponse")
public class GetCaseSampleInfoListResponse {

    @XmlElement(required = true, nillable = true)
    protected ArrayOfSampleInfo out;

    /**
     * 获取out属性的值。
     * 
     * @return
     *     possible object is
     *     {@link ArrayOfSampleInfo }
     *     
     */
    public ArrayOfSampleInfo getOut() {
        return out;
    }

    /**
     * 设置out属性的值。
     * 
     * @param value
     *     allowed object is
     *     {@link ArrayOfSampleInfo }
     *     
     */
    public void setOut(ArrayOfSampleInfo value) {
        this.out = value;
    }

}
