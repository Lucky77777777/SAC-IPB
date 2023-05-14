{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "86b32931",
   "metadata": {
    "papermill": {
     "duration": 0.010405,
     "end_time": "2023-05-14T08:04:58.359692",
     "exception": false,
     "start_time": "2023-05-14T08:04:58.349287",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Library"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "46f35850",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:04:58.381880Z",
     "iopub.status.busy": "2023-05-14T08:04:58.380323Z",
     "iopub.status.idle": "2023-05-14T08:05:01.308760Z",
     "shell.execute_reply": "2023-05-14T08:05:01.307562Z"
    },
    "papermill": {
     "duration": 2.941173,
     "end_time": "2023-05-14T08:05:01.310481",
     "exception": false,
     "start_time": "2023-05-14T08:04:58.369308",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: zoo\n",
      "\n",
      "\n",
      "Attaching package: ‘zoo’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:base’:\n",
      "\n",
      "    as.Date, as.Date.numeric\n",
      "\n",
      "\n",
      "Loading required package: carData\n",
      "\n",
      "Registered S3 method overwritten by 'quantmod':\n",
      "  method            from\n",
      "  as.zoo.data.frame zoo \n",
      "\n",
      "── \u001b[1mAttaching packages\u001b[22m ─────────────────────────────────────── tidyverse 1.3.2 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2\u001b[39m 3.4.0      \u001b[32m✔\u001b[39m \u001b[34mpurrr  \u001b[39m 1.0.1 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mtibble \u001b[39m 3.1.8      \u001b[32m✔\u001b[39m \u001b[34mdplyr  \u001b[39m 1.0.10\n",
      "\u001b[32m✔\u001b[39m \u001b[34mtidyr  \u001b[39m 1.2.1      \u001b[32m✔\u001b[39m \u001b[34mstringr\u001b[39m 1.5.0 \n",
      "\u001b[32m✔\u001b[39m \u001b[34mreadr  \u001b[39m 2.1.3      \u001b[32m✔\u001b[39m \u001b[34mforcats\u001b[39m 0.5.2 \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mrecode()\u001b[39m masks \u001b[34mcar\u001b[39m::recode()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mselect()\u001b[39m masks \u001b[34mMASS\u001b[39m::select()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mpurrr\u001b[39m::\u001b[32msome()\u001b[39m   masks \u001b[34mcar\u001b[39m::some()\n",
      "\n",
      "Attaching package: ‘plm’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:dplyr’:\n",
      "\n",
      "    between, lag, lead\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(MASS)\n",
    "library(lmtest)\n",
    "library(car)\n",
    "library(tseries)\n",
    "library(tidyverse)\n",
    "library(readxl)\n",
    "library(plm)\n",
    "library(ggplot2)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "9e80bb02",
   "metadata": {
    "papermill": {
     "duration": 0.010858,
     "end_time": "2023-05-14T08:05:01.331943",
     "exception": false,
     "start_time": "2023-05-14T08:05:01.321085",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "c7379b4a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:01.378242Z",
     "iopub.status.busy": "2023-05-14T08:05:01.352890Z",
     "iopub.status.idle": "2023-05-14T08:05:01.547813Z",
     "shell.execute_reply": "2023-05-14T08:05:01.546611Z"
    },
    "papermill": {
     "duration": 0.209175,
     "end_time": "2023-05-14T08:05:01.551083",
     "exception": false,
     "start_time": "2023-05-14T08:05:01.341908",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 162 × 18</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>No</th><th scope=col>Kode Kabupaten/Kota</th><th scope=col>Nama Kabupaten/Kota</th><th scope=col>Tahun</th><th scope=col>Latitude</th><th scope=col>Longitude</th><th scope=col>Persentase Bayi Stunting (%)</th><th scope=col>Persentase Rumah Tangga Sanitasi Layak (%)</th><th scope=col>Jumlah Rumah Tangga dengan Perilaku Hidup Bersih dan Sehat (PHBS) (Rumah tangga)</th><th scope=col>Angka Harapan Hidup (Tahun)</th><th scope=col>Produk Domestik Regional Bruto Per Kapita (Ribu Rupiah)</th><th scope=col>Persentase Penduduk Miskin (P0) (%)</th><th scope=col>[Metode Baru] Pengeluaran per Kapita Disesuaikan (Ribu Rupiah/Orang/Tahun)</th><th scope=col>Jumlah Angkatan Kerja (Orang)</th><th scope=col>Jumlah Penduduk yang Bekerja (Orang)</th><th scope=col>Tingkat Partisipasi Angkatan Kerja (%)</th><th scope=col>Persentase Tingkat Pengangguran Terbuka (%)</th><th scope=col>[Metode Baru] Rata-rata Lama Sekolah (Tahun)</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td> 1</td><td>3201</td><td>KABUPATEN BOGOR        </td><td>2022</td><td>-6.479679</td><td>106.8250</td><td>  NA</td><td>   NA</td><td>    NA</td><td>71.63</td><td>30173</td><td> 7.73</td><td>10860</td><td>2897332</td><td>2589167</td><td>63.75</td><td>10.64</td><td> 8.34</td></tr>\n",
       "\t<tr><td> 2</td><td>3202</td><td>KABUPATEN SUKABUMI     </td><td>2022</td><td>-6.915727</td><td>106.9326</td><td>  NA</td><td>   NA</td><td>    NA</td><td>71.50</td><td>17953</td><td> 7.34</td><td> 9210</td><td>1313905</td><td>1211763</td><td>69.11</td><td> 7.77</td><td> 7.11</td></tr>\n",
       "\t<tr><td> 3</td><td>3203</td><td>KABUPATEN CIANJUR      </td><td>2022</td><td>-6.822558</td><td>107.1395</td><td>  NA</td><td>   NA</td><td>    NA</td><td>70.56</td><td>13590</td><td>10.55</td><td> 8244</td><td>1222589</td><td>1119786</td><td>69.98</td><td> 8.41</td><td> 7.20</td></tr>\n",
       "\t<tr><td> 4</td><td>3204</td><td>KABUPATEN BANDUNG      </td><td>2022</td><td>-7.012851</td><td>107.5286</td><td>  NA</td><td>   NA</td><td>    NA</td><td>73.98</td><td>23782</td><td> 6.80</td><td>10588</td><td>1808799</td><td>1682510</td><td>63.64</td><td> 6.98</td><td> 9.08</td></tr>\n",
       "\t<tr><td> 5</td><td>3205</td><td>KABUPATEN GARUT        </td><td>2022</td><td>-7.202988</td><td>107.8856</td><td>  NA</td><td>   NA</td><td>    NA</td><td>71.74</td><td>15991</td><td>10.42</td><td> 8227</td><td>1330353</td><td>1229218</td><td>68.84</td><td> 7.60</td><td> 7.83</td></tr>\n",
       "\t<tr><td> 6</td><td>3206</td><td>KABUPATEN TASIKMALAYA  </td><td>2022</td><td>-7.361212</td><td>108.1125</td><td>  NA</td><td>   NA</td><td>    NA</td><td>69.93</td><td>13829</td><td>10.73</td><td> 8177</td><td> 940713</td><td> 901466</td><td>67.83</td><td> 4.17</td><td> 7.73</td></tr>\n",
       "\t<tr><td> 7</td><td>3207</td><td>KABUPATEN CIAMIS       </td><td>2022</td><td>-7.325788</td><td>108.3514</td><td>  NA</td><td>   NA</td><td>    NA</td><td>72.30</td><td>19169</td><td> 7.72</td><td> 9428</td><td> 664523</td><td> 639600</td><td>68.47</td><td> 3.75</td><td> 8.00</td></tr>\n",
       "\t<tr><td> 8</td><td>3208</td><td>KABUPATEN KUNINGAN     </td><td>2022</td><td>-6.976233</td><td>108.4830</td><td>  NA</td><td>   NA</td><td>    NA</td><td>74.03</td><td>15426</td><td>12.76</td><td> 9620</td><td> 530825</td><td> 478750</td><td>61.80</td><td> 9.81</td><td> 7.88</td></tr>\n",
       "\t<tr><td> 9</td><td>3209</td><td>KABUPATEN CIREBON      </td><td>2022</td><td>-6.764507</td><td>108.4789</td><td>  NA</td><td>   NA</td><td>    NA</td><td>72.46</td><td>15342</td><td>12.01</td><td>10791</td><td>1110529</td><td>1020411</td><td>65.53</td><td> 8.11</td><td> 7.40</td></tr>\n",
       "\t<tr><td>10</td><td>3210</td><td>KABUPATEN MAJALENGKA   </td><td>2022</td><td>-6.836531</td><td>108.2279</td><td>  NA</td><td>   NA</td><td>    NA</td><td>70.74</td><td>18197</td><td>11.94</td><td> 9950</td><td> 644128</td><td> 617320</td><td>66.21</td><td> 4.16</td><td> 7.49</td></tr>\n",
       "\t<tr><td>11</td><td>3211</td><td>KABUPATEN SUMEDANG     </td><td>2022</td><td>-6.861126</td><td>107.9201</td><td>  NA</td><td>   NA</td><td>    NA</td><td>72.87</td><td>21972</td><td>10.14</td><td>10776</td><td> 609471</td><td> 562416</td><td>64.63</td><td> 7.72</td><td> 8.72</td></tr>\n",
       "\t<tr><td>12</td><td>3212</td><td>KABUPATEN INDRAMAYU    </td><td>2022</td><td>-6.327234</td><td>108.3229</td><td>  NA</td><td>   NA</td><td>    NA</td><td>72.14</td><td>32727</td><td>12.77</td><td>10166</td><td> 952841</td><td> 890992</td><td>69.08</td><td> 6.49</td><td> 6.83</td></tr>\n",
       "\t<tr><td>13</td><td>3213</td><td>KABUPATEN SUBANG       </td><td>2022</td><td>-6.571549</td><td>107.7625</td><td>  NA</td><td>   NA</td><td>    NA</td><td>72.91</td><td>18580</td><td> 9.75</td><td>11294</td><td> 868132</td><td> 800701</td><td>68.87</td><td> 7.77</td><td> 7.20</td></tr>\n",
       "\t<tr><td>14</td><td>3214</td><td>KABUPATEN PURWAKARTA   </td><td>2022</td><td>-6.551701</td><td>107.4465</td><td>  NA</td><td>   NA</td><td>    NA</td><td>71.44</td><td>47924</td><td> 8.70</td><td>12193</td><td> 472075</td><td> 430788</td><td>65.21</td><td> 8.75</td><td> 8.11</td></tr>\n",
       "\t<tr><td>15</td><td>3215</td><td>KABUPATEN KARAWANG     </td><td>2022</td><td>-6.301721</td><td>107.3053</td><td>  NA</td><td>   NA</td><td>    NA</td><td>72.60</td><td>70840</td><td> 8.44</td><td>11927</td><td>1195947</td><td>1077939</td><td>65.51</td><td> 9.87</td><td> 7.96</td></tr>\n",
       "\t<tr><td>16</td><td>3216</td><td>KABUPATEN BEKASI       </td><td>2022</td><td>-6.364614</td><td>107.1725</td><td>  NA</td><td>   NA</td><td>    NA</td><td>74.02</td><td>82472</td><td> 5.01</td><td>11757</td><td>2006507</td><td>1799668</td><td>65.41</td><td>10.31</td><td> 9.53</td></tr>\n",
       "\t<tr><td>17</td><td>3217</td><td>KABUPATEN BANDUNG BARAT</td><td>2022</td><td>-6.840651</td><td>107.5123</td><td>  NA</td><td>   NA</td><td>    NA</td><td>72.78</td><td>18080</td><td>10.82</td><td> 9044</td><td> 819559</td><td> 740639</td><td>64.37</td><td> 9.63</td><td> 8.22</td></tr>\n",
       "\t<tr><td>18</td><td>3218</td><td>KABUPATEN PANGANDARAN  </td><td>2022</td><td>-7.701397</td><td>108.4952</td><td>  NA</td><td>   NA</td><td>    NA</td><td>71.86</td><td>19488</td><td> 9.32</td><td> 9389</td><td> 260761</td><td> 256684</td><td>79.92</td><td> 1.56</td><td> 8.03</td></tr>\n",
       "\t<tr><td>19</td><td>3271</td><td>KOTA BOGOR             </td><td>2022</td><td>-6.594946</td><td>106.7949</td><td>  NA</td><td>   NA</td><td>    NA</td><td>74.11</td><td>33153</td><td> 7.10</td><td>12058</td><td> 556541</td><td> 496570</td><td>64.21</td><td>10.78</td><td>10.63</td></tr>\n",
       "\t<tr><td>20</td><td>3272</td><td>KOTA SUKABUMI          </td><td>2022</td><td>-6.918366</td><td>106.9315</td><td>  NA</td><td>   NA</td><td>    NA</td><td>72.82</td><td>26161</td><td> 8.02</td><td>11229</td><td> 159618</td><td> 145522</td><td>62.48</td><td> 8.83</td><td>10.14</td></tr>\n",
       "\t<tr><td>21</td><td>3273</td><td>KOTA BANDUNG           </td><td>2022</td><td>-6.910786</td><td>107.6098</td><td>  NA</td><td>   NA</td><td>    NA</td><td>74.69</td><td>85820</td><td> 4.25</td><td>17639</td><td>1435635</td><td>1298537</td><td>69.42</td><td> 9.55</td><td>11.00</td></tr>\n",
       "\t<tr><td>22</td><td>3274</td><td>KOTA CIREBON           </td><td>2022</td><td>-6.707076</td><td>108.5578</td><td>  NA</td><td>   NA</td><td>    NA</td><td>72.72</td><td>52838</td><td> 9.82</td><td>12087</td><td> 163639</td><td> 149860</td><td>65.42</td><td> 8.42</td><td>10.33</td></tr>\n",
       "\t<tr><td>23</td><td>3275</td><td>KOTA BEKASI            </td><td>2022</td><td>-6.236221</td><td>106.9943</td><td>  NA</td><td>   NA</td><td>    NA</td><td>75.44</td><td>28283</td><td> 4.43</td><td>16239</td><td>1592545</td><td>1452223</td><td>65.33</td><td> 8.81</td><td>11.44</td></tr>\n",
       "\t<tr><td>24</td><td>3276</td><td>KOTA DEPOK             </td><td>2022</td><td>-6.394473</td><td>106.8227</td><td>  NA</td><td>   NA</td><td>    NA</td><td>75.00</td><td>24756</td><td> 2.53</td><td>15926</td><td>1258739</td><td>1160313</td><td>63.35</td><td> 7.82</td><td>11.47</td></tr>\n",
       "\t<tr><td>25</td><td>3277</td><td>KOTA CIMAHI            </td><td>2022</td><td>-6.871210</td><td>107.5555</td><td>  NA</td><td>   NA</td><td>    NA</td><td>74.46</td><td>42857</td><td> 5.11</td><td>12500</td><td> 320574</td><td> 286038</td><td>67.22</td><td>10.77</td><td>11.21</td></tr>\n",
       "\t<tr><td>26</td><td>3278</td><td>KOTA TASIKMALAYA       </td><td>2022</td><td>-7.316436</td><td>108.1971</td><td>  NA</td><td>   NA</td><td>    NA</td><td>72.62</td><td>22879</td><td>12.72</td><td>10578</td><td> 347063</td><td> 324099</td><td>65.99</td><td> 6.62</td><td> 9.53</td></tr>\n",
       "\t<tr><td>27</td><td>3279</td><td>KOTA BANJAR            </td><td>2022</td><td>-7.362487</td><td>108.5589</td><td>  NA</td><td>   NA</td><td>    NA</td><td>71.46</td><td>16983</td><td> 6.73</td><td>10967</td><td>  94831</td><td>  89588</td><td>63.76</td><td> 5.53</td><td> 8.78</td></tr>\n",
       "\t<tr><td>28</td><td>3201</td><td>KABUPATEN BOGOR        </td><td>2021</td><td>-6.479679</td><td>106.8250</td><td>9.59</td><td>74.45</td><td>573352</td><td>71.36</td><td>29072</td><td> 8.13</td><td>10410</td><td>2786372</td><td>2445768</td><td>62.55</td><td>12.22</td><td> 8.31</td></tr>\n",
       "\t<tr><td>29</td><td>3202</td><td>KABUPATEN SUKABUMI     </td><td>2021</td><td>-6.915727</td><td>106.9326</td><td>7.33</td><td>99.72</td><td>362219</td><td>71.21</td><td>17359</td><td> 7.70</td><td> 8850</td><td>1222156</td><td>1105875</td><td>64.93</td><td> 9.51</td><td> 7.10</td></tr>\n",
       "\t<tr><td>30</td><td>3203</td><td>KABUPATEN CIANJUR      </td><td>2021</td><td>-6.822558</td><td>107.1395</td><td>4.23</td><td>92.89</td><td>442503</td><td>70.32</td><td>13124</td><td>11.18</td><td> 8052</td><td>1175885</td><td>1066323</td><td>67.98</td><td> 9.32</td><td> 7.19</td></tr>\n",
       "\t<tr><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td><td>⋮</td></tr>\n",
       "\t<tr><td>133</td><td>3277</td><td>KOTA CIMAHI            </td><td>2018</td><td>-6.871210</td><td>107.5555</td><td> 9.75</td><td>72.11</td><td> 57904</td><td>73.75</td><td>34867</td><td> 4.94</td><td>11921</td><td> 297539</td><td> 273955</td><td>64.49</td><td> 7.93</td><td>10.94</td></tr>\n",
       "\t<tr><td>134</td><td>3278</td><td>KOTA TASIKMALAYA       </td><td>2018</td><td>-7.316436</td><td>108.1971</td><td>10.79</td><td> 0.00</td><td> 66086</td><td>71.70</td><td>22421</td><td>12.71</td><td> 9855</td><td> 308343</td><td> 287233</td><td>62.75</td><td> 6.85</td><td> 9.04</td></tr>\n",
       "\t<tr><td>135</td><td>3279</td><td>KOTA BANJAR            </td><td>2018</td><td>-7.362487</td><td>108.5589</td><td> 8.24</td><td>71.82</td><td> 44260</td><td>70.59</td><td>16777</td><td> 5.70</td><td>10329</td><td>  90439</td><td>  85113</td><td>65.09</td><td> 5.89</td><td> 8.60</td></tr>\n",
       "\t<tr><td>136</td><td>3201</td><td>KABUPATEN BOGOR        </td><td>2017</td><td>-6.479679</td><td>106.8250</td><td> 5.38</td><td>70.44</td><td>590603</td><td>70.70</td><td>24420</td><td> 8.57</td><td> 9901</td><td>2600121</td><td>2351753</td><td>64.07</td><td> 9.55</td><td> 7.84</td></tr>\n",
       "\t<tr><td>137</td><td>3202</td><td>KABUPATEN SUKABUMI     </td><td>2017</td><td>-6.915727</td><td>106.9326</td><td>10.93</td><td>55.86</td><td>322339</td><td>70.26</td><td>17003</td><td> 8.04</td><td> 8263</td><td>1123546</td><td>1037532</td><td>63.75</td><td> 7.66</td><td> 6.79</td></tr>\n",
       "\t<tr><td>138</td><td>3203</td><td>KABUPATEN CIANJUR      </td><td>2017</td><td>-6.822558</td><td>107.1395</td><td>13.92</td><td>63.83</td><td>325951</td><td>69.49</td><td>12647</td><td>11.41</td><td> 7300</td><td> 941358</td><td> 846258</td><td>58.28</td><td>10.10</td><td> 6.92</td></tr>\n",
       "\t<tr><td>139</td><td>3204</td><td>KABUPATEN BANDUNG      </td><td>2017</td><td>-7.012851</td><td>107.5286</td><td> 9.62</td><td>72.21</td><td>169886</td><td>73.13</td><td>19969</td><td> 7.36</td><td> 9854</td><td>1649064</td><td>1584391</td><td>62.81</td><td> 3.92</td><td> 8.51</td></tr>\n",
       "\t<tr><td>140</td><td>3205</td><td>KABUPATEN GARUT        </td><td>2017</td><td>-7.202988</td><td>107.8856</td><td>12.65</td><td>70.66</td><td>348450</td><td>70.84</td><td>13699</td><td>11.27</td><td> 7270</td><td>1133248</td><td>1044137</td><td>62.92</td><td> 7.86</td><td> 7.28</td></tr>\n",
       "\t<tr><td>141</td><td>3206</td><td>KABUPATEN TASIKMALAYA  </td><td>2017</td><td>-7.361212</td><td>108.1125</td><td>15.26</td><td>55.29</td><td>131205</td><td>68.71</td><td>12627</td><td>10.84</td><td> 7250</td><td> 816033</td><td> 762133</td><td>63.56</td><td> 6.61</td><td> 7.12</td></tr>\n",
       "\t<tr><td>142</td><td>3207</td><td>KABUPATEN CIAMIS       </td><td>2017</td><td>-7.325788</td><td>108.3514</td><td> 8.55</td><td>70.86</td><td>107240</td><td>71.07</td><td>16774</td><td> 8.20</td><td> 8658</td><td> 634932</td><td> 602123</td><td>70.10</td><td> 5.17</td><td> 7.59</td></tr>\n",
       "\t<tr><td>143</td><td>3208</td><td>KABUPATEN KUNINGAN     </td><td>2017</td><td>-6.976233</td><td>108.4830</td><td> 6.40</td><td>86.08</td><td>229101</td><td>72.88</td><td>13917</td><td>13.27</td><td> 8736</td><td> 462403</td><td> 425700</td><td>57.69</td><td> 7.94</td><td> 7.35</td></tr>\n",
       "\t<tr><td>144</td><td>3209</td><td>KABUPATEN CIREBON      </td><td>2017</td><td>-6.764507</td><td>108.4789</td><td>11.12</td><td>62.34</td><td>252985</td><td>71.49</td><td>14180</td><td>12.97</td><td> 9650</td><td> 974469</td><td> 880807</td><td>61.25</td><td> 9.61</td><td> 6.61</td></tr>\n",
       "\t<tr><td>145</td><td>3210</td><td>KABUPATEN MAJALENGKA   </td><td>2017</td><td>-6.836531</td><td>108.2279</td><td> 2.51</td><td>60.73</td><td>148275</td><td>69.39</td><td>15740</td><td>12.60</td><td> 8833</td><td> 599365</td><td> 569252</td><td>66.11</td><td> 5.02</td><td> 6.90</td></tr>\n",
       "\t<tr><td>146</td><td>3211</td><td>KABUPATEN SUMEDANG     </td><td>2017</td><td>-6.861126</td><td>107.9201</td><td>11.25</td><td>88.33</td><td>232843</td><td>72.00</td><td>18559</td><td>10.53</td><td> 9569</td><td> 544805</td><td> 505827</td><td>62.06</td><td> 7.15</td><td> 7.98</td></tr>\n",
       "\t<tr><td>147</td><td>3212</td><td>KABUPATEN INDRAMAYU    </td><td>2017</td><td>-6.327234</td><td>108.3229</td><td>23.06</td><td>75.40</td><td> 49741</td><td>70.86</td><td>33635</td><td>13.67</td><td> 9014</td><td> 816531</td><td> 746020</td><td>63.33</td><td> 8.64</td><td> 5.97</td></tr>\n",
       "\t<tr><td>148</td><td>3213</td><td>KABUPATEN SUBANG       </td><td>2017</td><td>-6.571549</td><td>107.7625</td><td> 4.93</td><td>85.17</td><td>158841</td><td>71.71</td><td>16800</td><td>10.77</td><td>10206</td><td> 793666</td><td> 724308</td><td>66.60</td><td> 8.74</td><td> 6.83</td></tr>\n",
       "\t<tr><td>149</td><td>3214</td><td>KABUPATEN PURWAKARTA   </td><td>2017</td><td>-6.551701</td><td>107.4465</td><td> 9.39</td><td>77.22</td><td>168236</td><td>70.42</td><td>44776</td><td> 9.06</td><td>10941</td><td> 432117</td><td> 392747</td><td>63.16</td><td> 9.11</td><td> 7.74</td></tr>\n",
       "\t<tr><td>150</td><td>3215</td><td>KABUPATEN KARAWANG     </td><td>2017</td><td>-6.301721</td><td>107.3053</td><td>14.18</td><td>44.71</td><td>323116</td><td>71.64</td><td>64045</td><td>10.25</td><td>10703</td><td>1117545</td><td>1010828</td><td>64.94</td><td> 9.55</td><td> 7.34</td></tr>\n",
       "\t<tr><td>151</td><td>3216</td><td>KABUPATEN BEKASI       </td><td>2017</td><td>-6.364614</td><td>107.1725</td><td> 4.25</td><td>60.44</td><td>572635</td><td>73.30</td><td>65201</td><td> 4.73</td><td>10790</td><td>1572155</td><td>1399743</td><td>61.26</td><td>10.97</td><td> 8.82</td></tr>\n",
       "\t<tr><td>152</td><td>3217</td><td>KABUPATEN BANDUNG BARAT</td><td>2017</td><td>-6.840651</td><td>107.5123</td><td> 8.00</td><td>60.99</td><td>137766</td><td>71.87</td><td>17000</td><td>11.49</td><td> 8002</td><td> 740957</td><td> 671847</td><td>61.73</td><td> 9.33</td><td> 7.74</td></tr>\n",
       "\t<tr><td>153</td><td>3218</td><td>KABUPATEN PANGANDARAN  </td><td>2017</td><td>-7.701397</td><td>108.4952</td><td> 3.79</td><td>58.35</td><td>113791</td><td>70.56</td><td>17564</td><td>10.00</td><td> 8588</td><td> 243702</td><td> 235561</td><td>79.88</td><td> 3.34</td><td> 7.37</td></tr>\n",
       "\t<tr><td>154</td><td>3271</td><td>KOTA BOGOR             </td><td>2017</td><td>-6.594946</td><td>106.7949</td><td> 6.59</td><td>65.68</td><td>125767</td><td>73.01</td><td>26508</td><td> 7.11</td><td>10940</td><td> 495824</td><td> 448386</td><td>61.13</td><td> 9.57</td><td>10.29</td></tr>\n",
       "\t<tr><td>155</td><td>3272</td><td>KOTA SUKABUMI          </td><td>2017</td><td>-6.918366</td><td>106.9315</td><td> 8.98</td><td>51.68</td><td> 31852</td><td>71.95</td><td>24029</td><td> 8.48</td><td>10188</td><td> 142285</td><td> 130909</td><td>59.24</td><td> 8.00</td><td> 9.52</td></tr>\n",
       "\t<tr><td>156</td><td>3273</td><td>KOTA BANDUNG           </td><td>2017</td><td>-6.910786</td><td>107.6098</td><td> 1.99</td><td>71.84</td><td>212765</td><td>73.86</td><td>69198</td><td> 4.17</td><td>16033</td><td>1219398</td><td>1116529</td><td>63.11</td><td> 8.44</td><td>10.59</td></tr>\n",
       "\t<tr><td>157</td><td>3274</td><td>KOTA CIREBON           </td><td>2017</td><td>-6.707076</td><td>108.5578</td><td>13.69</td><td>93.39</td><td> 45650</td><td>71.86</td><td>47533</td><td> 9.66</td><td>11100</td><td> 156814</td><td> 142246</td><td>66.45</td><td> 9.29</td><td> 9.88</td></tr>\n",
       "\t<tr><td>158</td><td>3275</td><td>KOTA BEKASI            </td><td>2017</td><td>-6.236221</td><td>106.9943</td><td>11.43</td><td>97.26</td><td> 60283</td><td>74.63</td><td>21752</td><td> 4.79</td><td>15378</td><td>1396946</td><td>1266692</td><td>64.35</td><td> 9.32</td><td>10.93</td></tr>\n",
       "\t<tr><td>159</td><td>3276</td><td>KOTA DEPOK             </td><td>2017</td><td>-6.394473</td><td>106.8227</td><td> 5.94</td><td>84.22</td><td>335852</td><td>74.04</td><td>19065</td><td> 2.34</td><td>14727</td><td>1085426</td><td>1009401</td><td>64.04</td><td> 7.00</td><td>10.84</td></tr>\n",
       "\t<tr><td>160</td><td>3277</td><td>KOTA CIMAHI            </td><td>2017</td><td>-6.871210</td><td>107.5555</td><td>14.54</td><td>70.31</td><td> 57904</td><td>73.61</td><td>33118</td><td> 5.76</td><td>11353</td><td> 297050</td><td> 272017</td><td>65.33</td><td> 8.43</td><td>10.93</td></tr>\n",
       "\t<tr><td>161</td><td>3278</td><td>KOTA TASIKMALAYA       </td><td>2017</td><td>-7.316436</td><td>108.1971</td><td>13.12</td><td>52.91</td><td> 66086</td><td>71.48</td><td>21209</td><td>14.80</td><td> 9497</td><td> 311874</td><td> 290396</td><td>63.88</td><td> 6.89</td><td> 9.03</td></tr>\n",
       "\t<tr><td>162</td><td>3279</td><td>KOTA BANJAR            </td><td>2017</td><td>-7.362487</td><td>108.5589</td><td> 7.96</td><td>80.36</td><td> 44260</td><td>70.39</td><td>16008</td><td> 7.06</td><td> 9987</td><td>  89369</td><td>  84032</td><td>64.78</td><td> 5.97</td><td> 8.59</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 162 × 18\n",
       "\\begin{tabular}{llllllllllllllllll}\n",
       " No & Kode Kabupaten/Kota & Nama Kabupaten/Kota & Tahun & Latitude & Longitude & Persentase Bayi Stunting (\\%) & Persentase Rumah Tangga Sanitasi Layak (\\%) & Jumlah Rumah Tangga dengan Perilaku Hidup Bersih dan Sehat (PHBS) (Rumah tangga) & Angka Harapan Hidup (Tahun) & Produk Domestik Regional Bruto Per Kapita (Ribu Rupiah) & Persentase Penduduk Miskin (P0) (\\%) & {[}Metode Baru{]} Pengeluaran per Kapita Disesuaikan (Ribu Rupiah/Orang/Tahun) & Jumlah Angkatan Kerja (Orang) & Jumlah Penduduk yang Bekerja (Orang) & Tingkat Partisipasi Angkatan Kerja (\\%) & Persentase Tingkat Pengangguran Terbuka (\\%) & {[}Metode Baru{]} Rata-rata Lama Sekolah (Tahun)\\\\\n",
       " <dbl> & <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t  1 & 3201 & KABUPATEN BOGOR         & 2022 & -6.479679 & 106.8250 &   NA &    NA &     NA & 71.63 & 30173 &  7.73 & 10860 & 2897332 & 2589167 & 63.75 & 10.64 &  8.34\\\\\n",
       "\t  2 & 3202 & KABUPATEN SUKABUMI      & 2022 & -6.915727 & 106.9326 &   NA &    NA &     NA & 71.50 & 17953 &  7.34 &  9210 & 1313905 & 1211763 & 69.11 &  7.77 &  7.11\\\\\n",
       "\t  3 & 3203 & KABUPATEN CIANJUR       & 2022 & -6.822558 & 107.1395 &   NA &    NA &     NA & 70.56 & 13590 & 10.55 &  8244 & 1222589 & 1119786 & 69.98 &  8.41 &  7.20\\\\\n",
       "\t  4 & 3204 & KABUPATEN BANDUNG       & 2022 & -7.012851 & 107.5286 &   NA &    NA &     NA & 73.98 & 23782 &  6.80 & 10588 & 1808799 & 1682510 & 63.64 &  6.98 &  9.08\\\\\n",
       "\t  5 & 3205 & KABUPATEN GARUT         & 2022 & -7.202988 & 107.8856 &   NA &    NA &     NA & 71.74 & 15991 & 10.42 &  8227 & 1330353 & 1229218 & 68.84 &  7.60 &  7.83\\\\\n",
       "\t  6 & 3206 & KABUPATEN TASIKMALAYA   & 2022 & -7.361212 & 108.1125 &   NA &    NA &     NA & 69.93 & 13829 & 10.73 &  8177 &  940713 &  901466 & 67.83 &  4.17 &  7.73\\\\\n",
       "\t  7 & 3207 & KABUPATEN CIAMIS        & 2022 & -7.325788 & 108.3514 &   NA &    NA &     NA & 72.30 & 19169 &  7.72 &  9428 &  664523 &  639600 & 68.47 &  3.75 &  8.00\\\\\n",
       "\t  8 & 3208 & KABUPATEN KUNINGAN      & 2022 & -6.976233 & 108.4830 &   NA &    NA &     NA & 74.03 & 15426 & 12.76 &  9620 &  530825 &  478750 & 61.80 &  9.81 &  7.88\\\\\n",
       "\t  9 & 3209 & KABUPATEN CIREBON       & 2022 & -6.764507 & 108.4789 &   NA &    NA &     NA & 72.46 & 15342 & 12.01 & 10791 & 1110529 & 1020411 & 65.53 &  8.11 &  7.40\\\\\n",
       "\t 10 & 3210 & KABUPATEN MAJALENGKA    & 2022 & -6.836531 & 108.2279 &   NA &    NA &     NA & 70.74 & 18197 & 11.94 &  9950 &  644128 &  617320 & 66.21 &  4.16 &  7.49\\\\\n",
       "\t 11 & 3211 & KABUPATEN SUMEDANG      & 2022 & -6.861126 & 107.9201 &   NA &    NA &     NA & 72.87 & 21972 & 10.14 & 10776 &  609471 &  562416 & 64.63 &  7.72 &  8.72\\\\\n",
       "\t 12 & 3212 & KABUPATEN INDRAMAYU     & 2022 & -6.327234 & 108.3229 &   NA &    NA &     NA & 72.14 & 32727 & 12.77 & 10166 &  952841 &  890992 & 69.08 &  6.49 &  6.83\\\\\n",
       "\t 13 & 3213 & KABUPATEN SUBANG        & 2022 & -6.571549 & 107.7625 &   NA &    NA &     NA & 72.91 & 18580 &  9.75 & 11294 &  868132 &  800701 & 68.87 &  7.77 &  7.20\\\\\n",
       "\t 14 & 3214 & KABUPATEN PURWAKARTA    & 2022 & -6.551701 & 107.4465 &   NA &    NA &     NA & 71.44 & 47924 &  8.70 & 12193 &  472075 &  430788 & 65.21 &  8.75 &  8.11\\\\\n",
       "\t 15 & 3215 & KABUPATEN KARAWANG      & 2022 & -6.301721 & 107.3053 &   NA &    NA &     NA & 72.60 & 70840 &  8.44 & 11927 & 1195947 & 1077939 & 65.51 &  9.87 &  7.96\\\\\n",
       "\t 16 & 3216 & KABUPATEN BEKASI        & 2022 & -6.364614 & 107.1725 &   NA &    NA &     NA & 74.02 & 82472 &  5.01 & 11757 & 2006507 & 1799668 & 65.41 & 10.31 &  9.53\\\\\n",
       "\t 17 & 3217 & KABUPATEN BANDUNG BARAT & 2022 & -6.840651 & 107.5123 &   NA &    NA &     NA & 72.78 & 18080 & 10.82 &  9044 &  819559 &  740639 & 64.37 &  9.63 &  8.22\\\\\n",
       "\t 18 & 3218 & KABUPATEN PANGANDARAN   & 2022 & -7.701397 & 108.4952 &   NA &    NA &     NA & 71.86 & 19488 &  9.32 &  9389 &  260761 &  256684 & 79.92 &  1.56 &  8.03\\\\\n",
       "\t 19 & 3271 & KOTA BOGOR              & 2022 & -6.594946 & 106.7949 &   NA &    NA &     NA & 74.11 & 33153 &  7.10 & 12058 &  556541 &  496570 & 64.21 & 10.78 & 10.63\\\\\n",
       "\t 20 & 3272 & KOTA SUKABUMI           & 2022 & -6.918366 & 106.9315 &   NA &    NA &     NA & 72.82 & 26161 &  8.02 & 11229 &  159618 &  145522 & 62.48 &  8.83 & 10.14\\\\\n",
       "\t 21 & 3273 & KOTA BANDUNG            & 2022 & -6.910786 & 107.6098 &   NA &    NA &     NA & 74.69 & 85820 &  4.25 & 17639 & 1435635 & 1298537 & 69.42 &  9.55 & 11.00\\\\\n",
       "\t 22 & 3274 & KOTA CIREBON            & 2022 & -6.707076 & 108.5578 &   NA &    NA &     NA & 72.72 & 52838 &  9.82 & 12087 &  163639 &  149860 & 65.42 &  8.42 & 10.33\\\\\n",
       "\t 23 & 3275 & KOTA BEKASI             & 2022 & -6.236221 & 106.9943 &   NA &    NA &     NA & 75.44 & 28283 &  4.43 & 16239 & 1592545 & 1452223 & 65.33 &  8.81 & 11.44\\\\\n",
       "\t 24 & 3276 & KOTA DEPOK              & 2022 & -6.394473 & 106.8227 &   NA &    NA &     NA & 75.00 & 24756 &  2.53 & 15926 & 1258739 & 1160313 & 63.35 &  7.82 & 11.47\\\\\n",
       "\t 25 & 3277 & KOTA CIMAHI             & 2022 & -6.871210 & 107.5555 &   NA &    NA &     NA & 74.46 & 42857 &  5.11 & 12500 &  320574 &  286038 & 67.22 & 10.77 & 11.21\\\\\n",
       "\t 26 & 3278 & KOTA TASIKMALAYA        & 2022 & -7.316436 & 108.1971 &   NA &    NA &     NA & 72.62 & 22879 & 12.72 & 10578 &  347063 &  324099 & 65.99 &  6.62 &  9.53\\\\\n",
       "\t 27 & 3279 & KOTA BANJAR             & 2022 & -7.362487 & 108.5589 &   NA &    NA &     NA & 71.46 & 16983 &  6.73 & 10967 &   94831 &   89588 & 63.76 &  5.53 &  8.78\\\\\n",
       "\t 28 & 3201 & KABUPATEN BOGOR         & 2021 & -6.479679 & 106.8250 & 9.59 & 74.45 & 573352 & 71.36 & 29072 &  8.13 & 10410 & 2786372 & 2445768 & 62.55 & 12.22 &  8.31\\\\\n",
       "\t 29 & 3202 & KABUPATEN SUKABUMI      & 2021 & -6.915727 & 106.9326 & 7.33 & 99.72 & 362219 & 71.21 & 17359 &  7.70 &  8850 & 1222156 & 1105875 & 64.93 &  9.51 &  7.10\\\\\n",
       "\t 30 & 3203 & KABUPATEN CIANJUR       & 2021 & -6.822558 & 107.1395 & 4.23 & 92.89 & 442503 & 70.32 & 13124 & 11.18 &  8052 & 1175885 & 1066323 & 67.98 &  9.32 &  7.19\\\\\n",
       "\t ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮ & ⋮\\\\\n",
       "\t 133 & 3277 & KOTA CIMAHI             & 2018 & -6.871210 & 107.5555 &  9.75 & 72.11 &  57904 & 73.75 & 34867 &  4.94 & 11921 &  297539 &  273955 & 64.49 &  7.93 & 10.94\\\\\n",
       "\t 134 & 3278 & KOTA TASIKMALAYA        & 2018 & -7.316436 & 108.1971 & 10.79 &  0.00 &  66086 & 71.70 & 22421 & 12.71 &  9855 &  308343 &  287233 & 62.75 &  6.85 &  9.04\\\\\n",
       "\t 135 & 3279 & KOTA BANJAR             & 2018 & -7.362487 & 108.5589 &  8.24 & 71.82 &  44260 & 70.59 & 16777 &  5.70 & 10329 &   90439 &   85113 & 65.09 &  5.89 &  8.60\\\\\n",
       "\t 136 & 3201 & KABUPATEN BOGOR         & 2017 & -6.479679 & 106.8250 &  5.38 & 70.44 & 590603 & 70.70 & 24420 &  8.57 &  9901 & 2600121 & 2351753 & 64.07 &  9.55 &  7.84\\\\\n",
       "\t 137 & 3202 & KABUPATEN SUKABUMI      & 2017 & -6.915727 & 106.9326 & 10.93 & 55.86 & 322339 & 70.26 & 17003 &  8.04 &  8263 & 1123546 & 1037532 & 63.75 &  7.66 &  6.79\\\\\n",
       "\t 138 & 3203 & KABUPATEN CIANJUR       & 2017 & -6.822558 & 107.1395 & 13.92 & 63.83 & 325951 & 69.49 & 12647 & 11.41 &  7300 &  941358 &  846258 & 58.28 & 10.10 &  6.92\\\\\n",
       "\t 139 & 3204 & KABUPATEN BANDUNG       & 2017 & -7.012851 & 107.5286 &  9.62 & 72.21 & 169886 & 73.13 & 19969 &  7.36 &  9854 & 1649064 & 1584391 & 62.81 &  3.92 &  8.51\\\\\n",
       "\t 140 & 3205 & KABUPATEN GARUT         & 2017 & -7.202988 & 107.8856 & 12.65 & 70.66 & 348450 & 70.84 & 13699 & 11.27 &  7270 & 1133248 & 1044137 & 62.92 &  7.86 &  7.28\\\\\n",
       "\t 141 & 3206 & KABUPATEN TASIKMALAYA   & 2017 & -7.361212 & 108.1125 & 15.26 & 55.29 & 131205 & 68.71 & 12627 & 10.84 &  7250 &  816033 &  762133 & 63.56 &  6.61 &  7.12\\\\\n",
       "\t 142 & 3207 & KABUPATEN CIAMIS        & 2017 & -7.325788 & 108.3514 &  8.55 & 70.86 & 107240 & 71.07 & 16774 &  8.20 &  8658 &  634932 &  602123 & 70.10 &  5.17 &  7.59\\\\\n",
       "\t 143 & 3208 & KABUPATEN KUNINGAN      & 2017 & -6.976233 & 108.4830 &  6.40 & 86.08 & 229101 & 72.88 & 13917 & 13.27 &  8736 &  462403 &  425700 & 57.69 &  7.94 &  7.35\\\\\n",
       "\t 144 & 3209 & KABUPATEN CIREBON       & 2017 & -6.764507 & 108.4789 & 11.12 & 62.34 & 252985 & 71.49 & 14180 & 12.97 &  9650 &  974469 &  880807 & 61.25 &  9.61 &  6.61\\\\\n",
       "\t 145 & 3210 & KABUPATEN MAJALENGKA    & 2017 & -6.836531 & 108.2279 &  2.51 & 60.73 & 148275 & 69.39 & 15740 & 12.60 &  8833 &  599365 &  569252 & 66.11 &  5.02 &  6.90\\\\\n",
       "\t 146 & 3211 & KABUPATEN SUMEDANG      & 2017 & -6.861126 & 107.9201 & 11.25 & 88.33 & 232843 & 72.00 & 18559 & 10.53 &  9569 &  544805 &  505827 & 62.06 &  7.15 &  7.98\\\\\n",
       "\t 147 & 3212 & KABUPATEN INDRAMAYU     & 2017 & -6.327234 & 108.3229 & 23.06 & 75.40 &  49741 & 70.86 & 33635 & 13.67 &  9014 &  816531 &  746020 & 63.33 &  8.64 &  5.97\\\\\n",
       "\t 148 & 3213 & KABUPATEN SUBANG        & 2017 & -6.571549 & 107.7625 &  4.93 & 85.17 & 158841 & 71.71 & 16800 & 10.77 & 10206 &  793666 &  724308 & 66.60 &  8.74 &  6.83\\\\\n",
       "\t 149 & 3214 & KABUPATEN PURWAKARTA    & 2017 & -6.551701 & 107.4465 &  9.39 & 77.22 & 168236 & 70.42 & 44776 &  9.06 & 10941 &  432117 &  392747 & 63.16 &  9.11 &  7.74\\\\\n",
       "\t 150 & 3215 & KABUPATEN KARAWANG      & 2017 & -6.301721 & 107.3053 & 14.18 & 44.71 & 323116 & 71.64 & 64045 & 10.25 & 10703 & 1117545 & 1010828 & 64.94 &  9.55 &  7.34\\\\\n",
       "\t 151 & 3216 & KABUPATEN BEKASI        & 2017 & -6.364614 & 107.1725 &  4.25 & 60.44 & 572635 & 73.30 & 65201 &  4.73 & 10790 & 1572155 & 1399743 & 61.26 & 10.97 &  8.82\\\\\n",
       "\t 152 & 3217 & KABUPATEN BANDUNG BARAT & 2017 & -6.840651 & 107.5123 &  8.00 & 60.99 & 137766 & 71.87 & 17000 & 11.49 &  8002 &  740957 &  671847 & 61.73 &  9.33 &  7.74\\\\\n",
       "\t 153 & 3218 & KABUPATEN PANGANDARAN   & 2017 & -7.701397 & 108.4952 &  3.79 & 58.35 & 113791 & 70.56 & 17564 & 10.00 &  8588 &  243702 &  235561 & 79.88 &  3.34 &  7.37\\\\\n",
       "\t 154 & 3271 & KOTA BOGOR              & 2017 & -6.594946 & 106.7949 &  6.59 & 65.68 & 125767 & 73.01 & 26508 &  7.11 & 10940 &  495824 &  448386 & 61.13 &  9.57 & 10.29\\\\\n",
       "\t 155 & 3272 & KOTA SUKABUMI           & 2017 & -6.918366 & 106.9315 &  8.98 & 51.68 &  31852 & 71.95 & 24029 &  8.48 & 10188 &  142285 &  130909 & 59.24 &  8.00 &  9.52\\\\\n",
       "\t 156 & 3273 & KOTA BANDUNG            & 2017 & -6.910786 & 107.6098 &  1.99 & 71.84 & 212765 & 73.86 & 69198 &  4.17 & 16033 & 1219398 & 1116529 & 63.11 &  8.44 & 10.59\\\\\n",
       "\t 157 & 3274 & KOTA CIREBON            & 2017 & -6.707076 & 108.5578 & 13.69 & 93.39 &  45650 & 71.86 & 47533 &  9.66 & 11100 &  156814 &  142246 & 66.45 &  9.29 &  9.88\\\\\n",
       "\t 158 & 3275 & KOTA BEKASI             & 2017 & -6.236221 & 106.9943 & 11.43 & 97.26 &  60283 & 74.63 & 21752 &  4.79 & 15378 & 1396946 & 1266692 & 64.35 &  9.32 & 10.93\\\\\n",
       "\t 159 & 3276 & KOTA DEPOK              & 2017 & -6.394473 & 106.8227 &  5.94 & 84.22 & 335852 & 74.04 & 19065 &  2.34 & 14727 & 1085426 & 1009401 & 64.04 &  7.00 & 10.84\\\\\n",
       "\t 160 & 3277 & KOTA CIMAHI             & 2017 & -6.871210 & 107.5555 & 14.54 & 70.31 &  57904 & 73.61 & 33118 &  5.76 & 11353 &  297050 &  272017 & 65.33 &  8.43 & 10.93\\\\\n",
       "\t 161 & 3278 & KOTA TASIKMALAYA        & 2017 & -7.316436 & 108.1971 & 13.12 & 52.91 &  66086 & 71.48 & 21209 & 14.80 &  9497 &  311874 &  290396 & 63.88 &  6.89 &  9.03\\\\\n",
       "\t 162 & 3279 & KOTA BANJAR             & 2017 & -7.362487 & 108.5589 &  7.96 & 80.36 &  44260 & 70.39 & 16008 &  7.06 &  9987 &   89369 &   84032 & 64.78 &  5.97 &  8.59\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 162 × 18\n",
       "\n",
       "| No &lt;dbl&gt; | Kode Kabupaten/Kota &lt;dbl&gt; | Nama Kabupaten/Kota &lt;chr&gt; | Tahun &lt;dbl&gt; | Latitude &lt;dbl&gt; | Longitude &lt;dbl&gt; | Persentase Bayi Stunting (%) &lt;dbl&gt; | Persentase Rumah Tangga Sanitasi Layak (%) &lt;dbl&gt; | Jumlah Rumah Tangga dengan Perilaku Hidup Bersih dan Sehat (PHBS) (Rumah tangga) &lt;dbl&gt; | Angka Harapan Hidup (Tahun) &lt;dbl&gt; | Produk Domestik Regional Bruto Per Kapita (Ribu Rupiah) &lt;dbl&gt; | Persentase Penduduk Miskin (P0) (%) &lt;dbl&gt; | [Metode Baru] Pengeluaran per Kapita Disesuaikan (Ribu Rupiah/Orang/Tahun) &lt;dbl&gt; | Jumlah Angkatan Kerja (Orang) &lt;dbl&gt; | Jumlah Penduduk yang Bekerja (Orang) &lt;dbl&gt; | Tingkat Partisipasi Angkatan Kerja (%) &lt;dbl&gt; | Persentase Tingkat Pengangguran Terbuka (%) &lt;dbl&gt; | [Metode Baru] Rata-rata Lama Sekolah (Tahun) &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "|  1 | 3201 | KABUPATEN BOGOR         | 2022 | -6.479679 | 106.8250 |   NA |    NA |     NA | 71.63 | 30173 |  7.73 | 10860 | 2897332 | 2589167 | 63.75 | 10.64 |  8.34 |\n",
       "|  2 | 3202 | KABUPATEN SUKABUMI      | 2022 | -6.915727 | 106.9326 |   NA |    NA |     NA | 71.50 | 17953 |  7.34 |  9210 | 1313905 | 1211763 | 69.11 |  7.77 |  7.11 |\n",
       "|  3 | 3203 | KABUPATEN CIANJUR       | 2022 | -6.822558 | 107.1395 |   NA |    NA |     NA | 70.56 | 13590 | 10.55 |  8244 | 1222589 | 1119786 | 69.98 |  8.41 |  7.20 |\n",
       "|  4 | 3204 | KABUPATEN BANDUNG       | 2022 | -7.012851 | 107.5286 |   NA |    NA |     NA | 73.98 | 23782 |  6.80 | 10588 | 1808799 | 1682510 | 63.64 |  6.98 |  9.08 |\n",
       "|  5 | 3205 | KABUPATEN GARUT         | 2022 | -7.202988 | 107.8856 |   NA |    NA |     NA | 71.74 | 15991 | 10.42 |  8227 | 1330353 | 1229218 | 68.84 |  7.60 |  7.83 |\n",
       "|  6 | 3206 | KABUPATEN TASIKMALAYA   | 2022 | -7.361212 | 108.1125 |   NA |    NA |     NA | 69.93 | 13829 | 10.73 |  8177 |  940713 |  901466 | 67.83 |  4.17 |  7.73 |\n",
       "|  7 | 3207 | KABUPATEN CIAMIS        | 2022 | -7.325788 | 108.3514 |   NA |    NA |     NA | 72.30 | 19169 |  7.72 |  9428 |  664523 |  639600 | 68.47 |  3.75 |  8.00 |\n",
       "|  8 | 3208 | KABUPATEN KUNINGAN      | 2022 | -6.976233 | 108.4830 |   NA |    NA |     NA | 74.03 | 15426 | 12.76 |  9620 |  530825 |  478750 | 61.80 |  9.81 |  7.88 |\n",
       "|  9 | 3209 | KABUPATEN CIREBON       | 2022 | -6.764507 | 108.4789 |   NA |    NA |     NA | 72.46 | 15342 | 12.01 | 10791 | 1110529 | 1020411 | 65.53 |  8.11 |  7.40 |\n",
       "| 10 | 3210 | KABUPATEN MAJALENGKA    | 2022 | -6.836531 | 108.2279 |   NA |    NA |     NA | 70.74 | 18197 | 11.94 |  9950 |  644128 |  617320 | 66.21 |  4.16 |  7.49 |\n",
       "| 11 | 3211 | KABUPATEN SUMEDANG      | 2022 | -6.861126 | 107.9201 |   NA |    NA |     NA | 72.87 | 21972 | 10.14 | 10776 |  609471 |  562416 | 64.63 |  7.72 |  8.72 |\n",
       "| 12 | 3212 | KABUPATEN INDRAMAYU     | 2022 | -6.327234 | 108.3229 |   NA |    NA |     NA | 72.14 | 32727 | 12.77 | 10166 |  952841 |  890992 | 69.08 |  6.49 |  6.83 |\n",
       "| 13 | 3213 | KABUPATEN SUBANG        | 2022 | -6.571549 | 107.7625 |   NA |    NA |     NA | 72.91 | 18580 |  9.75 | 11294 |  868132 |  800701 | 68.87 |  7.77 |  7.20 |\n",
       "| 14 | 3214 | KABUPATEN PURWAKARTA    | 2022 | -6.551701 | 107.4465 |   NA |    NA |     NA | 71.44 | 47924 |  8.70 | 12193 |  472075 |  430788 | 65.21 |  8.75 |  8.11 |\n",
       "| 15 | 3215 | KABUPATEN KARAWANG      | 2022 | -6.301721 | 107.3053 |   NA |    NA |     NA | 72.60 | 70840 |  8.44 | 11927 | 1195947 | 1077939 | 65.51 |  9.87 |  7.96 |\n",
       "| 16 | 3216 | KABUPATEN BEKASI        | 2022 | -6.364614 | 107.1725 |   NA |    NA |     NA | 74.02 | 82472 |  5.01 | 11757 | 2006507 | 1799668 | 65.41 | 10.31 |  9.53 |\n",
       "| 17 | 3217 | KABUPATEN BANDUNG BARAT | 2022 | -6.840651 | 107.5123 |   NA |    NA |     NA | 72.78 | 18080 | 10.82 |  9044 |  819559 |  740639 | 64.37 |  9.63 |  8.22 |\n",
       "| 18 | 3218 | KABUPATEN PANGANDARAN   | 2022 | -7.701397 | 108.4952 |   NA |    NA |     NA | 71.86 | 19488 |  9.32 |  9389 |  260761 |  256684 | 79.92 |  1.56 |  8.03 |\n",
       "| 19 | 3271 | KOTA BOGOR              | 2022 | -6.594946 | 106.7949 |   NA |    NA |     NA | 74.11 | 33153 |  7.10 | 12058 |  556541 |  496570 | 64.21 | 10.78 | 10.63 |\n",
       "| 20 | 3272 | KOTA SUKABUMI           | 2022 | -6.918366 | 106.9315 |   NA |    NA |     NA | 72.82 | 26161 |  8.02 | 11229 |  159618 |  145522 | 62.48 |  8.83 | 10.14 |\n",
       "| 21 | 3273 | KOTA BANDUNG            | 2022 | -6.910786 | 107.6098 |   NA |    NA |     NA | 74.69 | 85820 |  4.25 | 17639 | 1435635 | 1298537 | 69.42 |  9.55 | 11.00 |\n",
       "| 22 | 3274 | KOTA CIREBON            | 2022 | -6.707076 | 108.5578 |   NA |    NA |     NA | 72.72 | 52838 |  9.82 | 12087 |  163639 |  149860 | 65.42 |  8.42 | 10.33 |\n",
       "| 23 | 3275 | KOTA BEKASI             | 2022 | -6.236221 | 106.9943 |   NA |    NA |     NA | 75.44 | 28283 |  4.43 | 16239 | 1592545 | 1452223 | 65.33 |  8.81 | 11.44 |\n",
       "| 24 | 3276 | KOTA DEPOK              | 2022 | -6.394473 | 106.8227 |   NA |    NA |     NA | 75.00 | 24756 |  2.53 | 15926 | 1258739 | 1160313 | 63.35 |  7.82 | 11.47 |\n",
       "| 25 | 3277 | KOTA CIMAHI             | 2022 | -6.871210 | 107.5555 |   NA |    NA |     NA | 74.46 | 42857 |  5.11 | 12500 |  320574 |  286038 | 67.22 | 10.77 | 11.21 |\n",
       "| 26 | 3278 | KOTA TASIKMALAYA        | 2022 | -7.316436 | 108.1971 |   NA |    NA |     NA | 72.62 | 22879 | 12.72 | 10578 |  347063 |  324099 | 65.99 |  6.62 |  9.53 |\n",
       "| 27 | 3279 | KOTA BANJAR             | 2022 | -7.362487 | 108.5589 |   NA |    NA |     NA | 71.46 | 16983 |  6.73 | 10967 |   94831 |   89588 | 63.76 |  5.53 |  8.78 |\n",
       "| 28 | 3201 | KABUPATEN BOGOR         | 2021 | -6.479679 | 106.8250 | 9.59 | 74.45 | 573352 | 71.36 | 29072 |  8.13 | 10410 | 2786372 | 2445768 | 62.55 | 12.22 |  8.31 |\n",
       "| 29 | 3202 | KABUPATEN SUKABUMI      | 2021 | -6.915727 | 106.9326 | 7.33 | 99.72 | 362219 | 71.21 | 17359 |  7.70 |  8850 | 1222156 | 1105875 | 64.93 |  9.51 |  7.10 |\n",
       "| 30 | 3203 | KABUPATEN CIANJUR       | 2021 | -6.822558 | 107.1395 | 4.23 | 92.89 | 442503 | 70.32 | 13124 | 11.18 |  8052 | 1175885 | 1066323 | 67.98 |  9.32 |  7.19 |\n",
       "| ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ | ⋮ |\n",
       "| 133 | 3277 | KOTA CIMAHI             | 2018 | -6.871210 | 107.5555 |  9.75 | 72.11 |  57904 | 73.75 | 34867 |  4.94 | 11921 |  297539 |  273955 | 64.49 |  7.93 | 10.94 |\n",
       "| 134 | 3278 | KOTA TASIKMALAYA        | 2018 | -7.316436 | 108.1971 | 10.79 |  0.00 |  66086 | 71.70 | 22421 | 12.71 |  9855 |  308343 |  287233 | 62.75 |  6.85 |  9.04 |\n",
       "| 135 | 3279 | KOTA BANJAR             | 2018 | -7.362487 | 108.5589 |  8.24 | 71.82 |  44260 | 70.59 | 16777 |  5.70 | 10329 |   90439 |   85113 | 65.09 |  5.89 |  8.60 |\n",
       "| 136 | 3201 | KABUPATEN BOGOR         | 2017 | -6.479679 | 106.8250 |  5.38 | 70.44 | 590603 | 70.70 | 24420 |  8.57 |  9901 | 2600121 | 2351753 | 64.07 |  9.55 |  7.84 |\n",
       "| 137 | 3202 | KABUPATEN SUKABUMI      | 2017 | -6.915727 | 106.9326 | 10.93 | 55.86 | 322339 | 70.26 | 17003 |  8.04 |  8263 | 1123546 | 1037532 | 63.75 |  7.66 |  6.79 |\n",
       "| 138 | 3203 | KABUPATEN CIANJUR       | 2017 | -6.822558 | 107.1395 | 13.92 | 63.83 | 325951 | 69.49 | 12647 | 11.41 |  7300 |  941358 |  846258 | 58.28 | 10.10 |  6.92 |\n",
       "| 139 | 3204 | KABUPATEN BANDUNG       | 2017 | -7.012851 | 107.5286 |  9.62 | 72.21 | 169886 | 73.13 | 19969 |  7.36 |  9854 | 1649064 | 1584391 | 62.81 |  3.92 |  8.51 |\n",
       "| 140 | 3205 | KABUPATEN GARUT         | 2017 | -7.202988 | 107.8856 | 12.65 | 70.66 | 348450 | 70.84 | 13699 | 11.27 |  7270 | 1133248 | 1044137 | 62.92 |  7.86 |  7.28 |\n",
       "| 141 | 3206 | KABUPATEN TASIKMALAYA   | 2017 | -7.361212 | 108.1125 | 15.26 | 55.29 | 131205 | 68.71 | 12627 | 10.84 |  7250 |  816033 |  762133 | 63.56 |  6.61 |  7.12 |\n",
       "| 142 | 3207 | KABUPATEN CIAMIS        | 2017 | -7.325788 | 108.3514 |  8.55 | 70.86 | 107240 | 71.07 | 16774 |  8.20 |  8658 |  634932 |  602123 | 70.10 |  5.17 |  7.59 |\n",
       "| 143 | 3208 | KABUPATEN KUNINGAN      | 2017 | -6.976233 | 108.4830 |  6.40 | 86.08 | 229101 | 72.88 | 13917 | 13.27 |  8736 |  462403 |  425700 | 57.69 |  7.94 |  7.35 |\n",
       "| 144 | 3209 | KABUPATEN CIREBON       | 2017 | -6.764507 | 108.4789 | 11.12 | 62.34 | 252985 | 71.49 | 14180 | 12.97 |  9650 |  974469 |  880807 | 61.25 |  9.61 |  6.61 |\n",
       "| 145 | 3210 | KABUPATEN MAJALENGKA    | 2017 | -6.836531 | 108.2279 |  2.51 | 60.73 | 148275 | 69.39 | 15740 | 12.60 |  8833 |  599365 |  569252 | 66.11 |  5.02 |  6.90 |\n",
       "| 146 | 3211 | KABUPATEN SUMEDANG      | 2017 | -6.861126 | 107.9201 | 11.25 | 88.33 | 232843 | 72.00 | 18559 | 10.53 |  9569 |  544805 |  505827 | 62.06 |  7.15 |  7.98 |\n",
       "| 147 | 3212 | KABUPATEN INDRAMAYU     | 2017 | -6.327234 | 108.3229 | 23.06 | 75.40 |  49741 | 70.86 | 33635 | 13.67 |  9014 |  816531 |  746020 | 63.33 |  8.64 |  5.97 |\n",
       "| 148 | 3213 | KABUPATEN SUBANG        | 2017 | -6.571549 | 107.7625 |  4.93 | 85.17 | 158841 | 71.71 | 16800 | 10.77 | 10206 |  793666 |  724308 | 66.60 |  8.74 |  6.83 |\n",
       "| 149 | 3214 | KABUPATEN PURWAKARTA    | 2017 | -6.551701 | 107.4465 |  9.39 | 77.22 | 168236 | 70.42 | 44776 |  9.06 | 10941 |  432117 |  392747 | 63.16 |  9.11 |  7.74 |\n",
       "| 150 | 3215 | KABUPATEN KARAWANG      | 2017 | -6.301721 | 107.3053 | 14.18 | 44.71 | 323116 | 71.64 | 64045 | 10.25 | 10703 | 1117545 | 1010828 | 64.94 |  9.55 |  7.34 |\n",
       "| 151 | 3216 | KABUPATEN BEKASI        | 2017 | -6.364614 | 107.1725 |  4.25 | 60.44 | 572635 | 73.30 | 65201 |  4.73 | 10790 | 1572155 | 1399743 | 61.26 | 10.97 |  8.82 |\n",
       "| 152 | 3217 | KABUPATEN BANDUNG BARAT | 2017 | -6.840651 | 107.5123 |  8.00 | 60.99 | 137766 | 71.87 | 17000 | 11.49 |  8002 |  740957 |  671847 | 61.73 |  9.33 |  7.74 |\n",
       "| 153 | 3218 | KABUPATEN PANGANDARAN   | 2017 | -7.701397 | 108.4952 |  3.79 | 58.35 | 113791 | 70.56 | 17564 | 10.00 |  8588 |  243702 |  235561 | 79.88 |  3.34 |  7.37 |\n",
       "| 154 | 3271 | KOTA BOGOR              | 2017 | -6.594946 | 106.7949 |  6.59 | 65.68 | 125767 | 73.01 | 26508 |  7.11 | 10940 |  495824 |  448386 | 61.13 |  9.57 | 10.29 |\n",
       "| 155 | 3272 | KOTA SUKABUMI           | 2017 | -6.918366 | 106.9315 |  8.98 | 51.68 |  31852 | 71.95 | 24029 |  8.48 | 10188 |  142285 |  130909 | 59.24 |  8.00 |  9.52 |\n",
       "| 156 | 3273 | KOTA BANDUNG            | 2017 | -6.910786 | 107.6098 |  1.99 | 71.84 | 212765 | 73.86 | 69198 |  4.17 | 16033 | 1219398 | 1116529 | 63.11 |  8.44 | 10.59 |\n",
       "| 157 | 3274 | KOTA CIREBON            | 2017 | -6.707076 | 108.5578 | 13.69 | 93.39 |  45650 | 71.86 | 47533 |  9.66 | 11100 |  156814 |  142246 | 66.45 |  9.29 |  9.88 |\n",
       "| 158 | 3275 | KOTA BEKASI             | 2017 | -6.236221 | 106.9943 | 11.43 | 97.26 |  60283 | 74.63 | 21752 |  4.79 | 15378 | 1396946 | 1266692 | 64.35 |  9.32 | 10.93 |\n",
       "| 159 | 3276 | KOTA DEPOK              | 2017 | -6.394473 | 106.8227 |  5.94 | 84.22 | 335852 | 74.04 | 19065 |  2.34 | 14727 | 1085426 | 1009401 | 64.04 |  7.00 | 10.84 |\n",
       "| 160 | 3277 | KOTA CIMAHI             | 2017 | -6.871210 | 107.5555 | 14.54 | 70.31 |  57904 | 73.61 | 33118 |  5.76 | 11353 |  297050 |  272017 | 65.33 |  8.43 | 10.93 |\n",
       "| 161 | 3278 | KOTA TASIKMALAYA        | 2017 | -7.316436 | 108.1971 | 13.12 | 52.91 |  66086 | 71.48 | 21209 | 14.80 |  9497 |  311874 |  290396 | 63.88 |  6.89 |  9.03 |\n",
       "| 162 | 3279 | KOTA BANJAR             | 2017 | -7.362487 | 108.5589 |  7.96 | 80.36 |  44260 | 70.39 | 16008 |  7.06 |  9987 |   89369 |   84032 | 64.78 |  5.97 |  8.59 |\n",
       "\n"
      ],
      "text/plain": [
       "    No  Kode Kabupaten/Kota Nama Kabupaten/Kota     Tahun Latitude  Longitude\n",
       "1    1  3201                KABUPATEN BOGOR         2022  -6.479679 106.8250 \n",
       "2    2  3202                KABUPATEN SUKABUMI      2022  -6.915727 106.9326 \n",
       "3    3  3203                KABUPATEN CIANJUR       2022  -6.822558 107.1395 \n",
       "4    4  3204                KABUPATEN BANDUNG       2022  -7.012851 107.5286 \n",
       "5    5  3205                KABUPATEN GARUT         2022  -7.202988 107.8856 \n",
       "6    6  3206                KABUPATEN TASIKMALAYA   2022  -7.361212 108.1125 \n",
       "7    7  3207                KABUPATEN CIAMIS        2022  -7.325788 108.3514 \n",
       "8    8  3208                KABUPATEN KUNINGAN      2022  -6.976233 108.4830 \n",
       "9    9  3209                KABUPATEN CIREBON       2022  -6.764507 108.4789 \n",
       "10  10  3210                KABUPATEN MAJALENGKA    2022  -6.836531 108.2279 \n",
       "11  11  3211                KABUPATEN SUMEDANG      2022  -6.861126 107.9201 \n",
       "12  12  3212                KABUPATEN INDRAMAYU     2022  -6.327234 108.3229 \n",
       "13  13  3213                KABUPATEN SUBANG        2022  -6.571549 107.7625 \n",
       "14  14  3214                KABUPATEN PURWAKARTA    2022  -6.551701 107.4465 \n",
       "15  15  3215                KABUPATEN KARAWANG      2022  -6.301721 107.3053 \n",
       "16  16  3216                KABUPATEN BEKASI        2022  -6.364614 107.1725 \n",
       "17  17  3217                KABUPATEN BANDUNG BARAT 2022  -6.840651 107.5123 \n",
       "18  18  3218                KABUPATEN PANGANDARAN   2022  -7.701397 108.4952 \n",
       "19  19  3271                KOTA BOGOR              2022  -6.594946 106.7949 \n",
       "20  20  3272                KOTA SUKABUMI           2022  -6.918366 106.9315 \n",
       "21  21  3273                KOTA BANDUNG            2022  -6.910786 107.6098 \n",
       "22  22  3274                KOTA CIREBON            2022  -6.707076 108.5578 \n",
       "23  23  3275                KOTA BEKASI             2022  -6.236221 106.9943 \n",
       "24  24  3276                KOTA DEPOK              2022  -6.394473 106.8227 \n",
       "25  25  3277                KOTA CIMAHI             2022  -6.871210 107.5555 \n",
       "26  26  3278                KOTA TASIKMALAYA        2022  -7.316436 108.1971 \n",
       "27  27  3279                KOTA BANJAR             2022  -7.362487 108.5589 \n",
       "28  28  3201                KABUPATEN BOGOR         2021  -6.479679 106.8250 \n",
       "29  29  3202                KABUPATEN SUKABUMI      2021  -6.915727 106.9326 \n",
       "30  30  3203                KABUPATEN CIANJUR       2021  -6.822558 107.1395 \n",
       "⋮   ⋮   ⋮                   ⋮                       ⋮     ⋮         ⋮        \n",
       "133 133 3277                KOTA CIMAHI             2018  -6.871210 107.5555 \n",
       "134 134 3278                KOTA TASIKMALAYA        2018  -7.316436 108.1971 \n",
       "135 135 3279                KOTA BANJAR             2018  -7.362487 108.5589 \n",
       "136 136 3201                KABUPATEN BOGOR         2017  -6.479679 106.8250 \n",
       "137 137 3202                KABUPATEN SUKABUMI      2017  -6.915727 106.9326 \n",
       "138 138 3203                KABUPATEN CIANJUR       2017  -6.822558 107.1395 \n",
       "139 139 3204                KABUPATEN BANDUNG       2017  -7.012851 107.5286 \n",
       "140 140 3205                KABUPATEN GARUT         2017  -7.202988 107.8856 \n",
       "141 141 3206                KABUPATEN TASIKMALAYA   2017  -7.361212 108.1125 \n",
       "142 142 3207                KABUPATEN CIAMIS        2017  -7.325788 108.3514 \n",
       "143 143 3208                KABUPATEN KUNINGAN      2017  -6.976233 108.4830 \n",
       "144 144 3209                KABUPATEN CIREBON       2017  -6.764507 108.4789 \n",
       "145 145 3210                KABUPATEN MAJALENGKA    2017  -6.836531 108.2279 \n",
       "146 146 3211                KABUPATEN SUMEDANG      2017  -6.861126 107.9201 \n",
       "147 147 3212                KABUPATEN INDRAMAYU     2017  -6.327234 108.3229 \n",
       "148 148 3213                KABUPATEN SUBANG        2017  -6.571549 107.7625 \n",
       "149 149 3214                KABUPATEN PURWAKARTA    2017  -6.551701 107.4465 \n",
       "150 150 3215                KABUPATEN KARAWANG      2017  -6.301721 107.3053 \n",
       "151 151 3216                KABUPATEN BEKASI        2017  -6.364614 107.1725 \n",
       "152 152 3217                KABUPATEN BANDUNG BARAT 2017  -6.840651 107.5123 \n",
       "153 153 3218                KABUPATEN PANGANDARAN   2017  -7.701397 108.4952 \n",
       "154 154 3271                KOTA BOGOR              2017  -6.594946 106.7949 \n",
       "155 155 3272                KOTA SUKABUMI           2017  -6.918366 106.9315 \n",
       "156 156 3273                KOTA BANDUNG            2017  -6.910786 107.6098 \n",
       "157 157 3274                KOTA CIREBON            2017  -6.707076 108.5578 \n",
       "158 158 3275                KOTA BEKASI             2017  -6.236221 106.9943 \n",
       "159 159 3276                KOTA DEPOK              2017  -6.394473 106.8227 \n",
       "160 160 3277                KOTA CIMAHI             2017  -6.871210 107.5555 \n",
       "161 161 3278                KOTA TASIKMALAYA        2017  -7.316436 108.1971 \n",
       "162 162 3279                KOTA BANJAR             2017  -7.362487 108.5589 \n",
       "    Persentase Bayi Stunting (%) Persentase Rumah Tangga Sanitasi Layak (%)\n",
       "1     NA                            NA                                     \n",
       "2     NA                            NA                                     \n",
       "3     NA                            NA                                     \n",
       "4     NA                            NA                                     \n",
       "5     NA                            NA                                     \n",
       "6     NA                            NA                                     \n",
       "7     NA                            NA                                     \n",
       "8     NA                            NA                                     \n",
       "9     NA                            NA                                     \n",
       "10    NA                            NA                                     \n",
       "11    NA                            NA                                     \n",
       "12    NA                            NA                                     \n",
       "13    NA                            NA                                     \n",
       "14    NA                            NA                                     \n",
       "15    NA                            NA                                     \n",
       "16    NA                            NA                                     \n",
       "17    NA                            NA                                     \n",
       "18    NA                            NA                                     \n",
       "19    NA                            NA                                     \n",
       "20    NA                            NA                                     \n",
       "21    NA                            NA                                     \n",
       "22    NA                            NA                                     \n",
       "23    NA                            NA                                     \n",
       "24    NA                            NA                                     \n",
       "25    NA                            NA                                     \n",
       "26    NA                            NA                                     \n",
       "27    NA                            NA                                     \n",
       "28  9.59                         74.45                                     \n",
       "29  7.33                         99.72                                     \n",
       "30  4.23                         92.89                                     \n",
       "⋮   ⋮                            ⋮                                         \n",
       "133  9.75                        72.11                                     \n",
       "134 10.79                         0.00                                     \n",
       "135  8.24                        71.82                                     \n",
       "136  5.38                        70.44                                     \n",
       "137 10.93                        55.86                                     \n",
       "138 13.92                        63.83                                     \n",
       "139  9.62                        72.21                                     \n",
       "140 12.65                        70.66                                     \n",
       "141 15.26                        55.29                                     \n",
       "142  8.55                        70.86                                     \n",
       "143  6.40                        86.08                                     \n",
       "144 11.12                        62.34                                     \n",
       "145  2.51                        60.73                                     \n",
       "146 11.25                        88.33                                     \n",
       "147 23.06                        75.40                                     \n",
       "148  4.93                        85.17                                     \n",
       "149  9.39                        77.22                                     \n",
       "150 14.18                        44.71                                     \n",
       "151  4.25                        60.44                                     \n",
       "152  8.00                        60.99                                     \n",
       "153  3.79                        58.35                                     \n",
       "154  6.59                        65.68                                     \n",
       "155  8.98                        51.68                                     \n",
       "156  1.99                        71.84                                     \n",
       "157 13.69                        93.39                                     \n",
       "158 11.43                        97.26                                     \n",
       "159  5.94                        84.22                                     \n",
       "160 14.54                        70.31                                     \n",
       "161 13.12                        52.91                                     \n",
       "162  7.96                        80.36                                     \n",
       "    Jumlah Rumah Tangga dengan Perilaku Hidup Bersih dan Sehat (PHBS) (Rumah tangga)\n",
       "1       NA                                                                          \n",
       "2       NA                                                                          \n",
       "3       NA                                                                          \n",
       "4       NA                                                                          \n",
       "5       NA                                                                          \n",
       "6       NA                                                                          \n",
       "7       NA                                                                          \n",
       "8       NA                                                                          \n",
       "9       NA                                                                          \n",
       "10      NA                                                                          \n",
       "11      NA                                                                          \n",
       "12      NA                                                                          \n",
       "13      NA                                                                          \n",
       "14      NA                                                                          \n",
       "15      NA                                                                          \n",
       "16      NA                                                                          \n",
       "17      NA                                                                          \n",
       "18      NA                                                                          \n",
       "19      NA                                                                          \n",
       "20      NA                                                                          \n",
       "21      NA                                                                          \n",
       "22      NA                                                                          \n",
       "23      NA                                                                          \n",
       "24      NA                                                                          \n",
       "25      NA                                                                          \n",
       "26      NA                                                                          \n",
       "27      NA                                                                          \n",
       "28  573352                                                                          \n",
       "29  362219                                                                          \n",
       "30  442503                                                                          \n",
       "⋮   ⋮                                                                               \n",
       "133  57904                                                                          \n",
       "134  66086                                                                          \n",
       "135  44260                                                                          \n",
       "136 590603                                                                          \n",
       "137 322339                                                                          \n",
       "138 325951                                                                          \n",
       "139 169886                                                                          \n",
       "140 348450                                                                          \n",
       "141 131205                                                                          \n",
       "142 107240                                                                          \n",
       "143 229101                                                                          \n",
       "144 252985                                                                          \n",
       "145 148275                                                                          \n",
       "146 232843                                                                          \n",
       "147  49741                                                                          \n",
       "148 158841                                                                          \n",
       "149 168236                                                                          \n",
       "150 323116                                                                          \n",
       "151 572635                                                                          \n",
       "152 137766                                                                          \n",
       "153 113791                                                                          \n",
       "154 125767                                                                          \n",
       "155  31852                                                                          \n",
       "156 212765                                                                          \n",
       "157  45650                                                                          \n",
       "158  60283                                                                          \n",
       "159 335852                                                                          \n",
       "160  57904                                                                          \n",
       "161  66086                                                                          \n",
       "162  44260                                                                          \n",
       "    Angka Harapan Hidup (Tahun)\n",
       "1   71.63                      \n",
       "2   71.50                      \n",
       "3   70.56                      \n",
       "4   73.98                      \n",
       "5   71.74                      \n",
       "6   69.93                      \n",
       "7   72.30                      \n",
       "8   74.03                      \n",
       "9   72.46                      \n",
       "10  70.74                      \n",
       "11  72.87                      \n",
       "12  72.14                      \n",
       "13  72.91                      \n",
       "14  71.44                      \n",
       "15  72.60                      \n",
       "16  74.02                      \n",
       "17  72.78                      \n",
       "18  71.86                      \n",
       "19  74.11                      \n",
       "20  72.82                      \n",
       "21  74.69                      \n",
       "22  72.72                      \n",
       "23  75.44                      \n",
       "24  75.00                      \n",
       "25  74.46                      \n",
       "26  72.62                      \n",
       "27  71.46                      \n",
       "28  71.36                      \n",
       "29  71.21                      \n",
       "30  70.32                      \n",
       "⋮   ⋮                          \n",
       "133 73.75                      \n",
       "134 71.70                      \n",
       "135 70.59                      \n",
       "136 70.70                      \n",
       "137 70.26                      \n",
       "138 69.49                      \n",
       "139 73.13                      \n",
       "140 70.84                      \n",
       "141 68.71                      \n",
       "142 71.07                      \n",
       "143 72.88                      \n",
       "144 71.49                      \n",
       "145 69.39                      \n",
       "146 72.00                      \n",
       "147 70.86                      \n",
       "148 71.71                      \n",
       "149 70.42                      \n",
       "150 71.64                      \n",
       "151 73.30                      \n",
       "152 71.87                      \n",
       "153 70.56                      \n",
       "154 73.01                      \n",
       "155 71.95                      \n",
       "156 73.86                      \n",
       "157 71.86                      \n",
       "158 74.63                      \n",
       "159 74.04                      \n",
       "160 73.61                      \n",
       "161 71.48                      \n",
       "162 70.39                      \n",
       "    Produk Domestik Regional Bruto Per Kapita (Ribu Rupiah)\n",
       "1   30173                                                  \n",
       "2   17953                                                  \n",
       "3   13590                                                  \n",
       "4   23782                                                  \n",
       "5   15991                                                  \n",
       "6   13829                                                  \n",
       "7   19169                                                  \n",
       "8   15426                                                  \n",
       "9   15342                                                  \n",
       "10  18197                                                  \n",
       "11  21972                                                  \n",
       "12  32727                                                  \n",
       "13  18580                                                  \n",
       "14  47924                                                  \n",
       "15  70840                                                  \n",
       "16  82472                                                  \n",
       "17  18080                                                  \n",
       "18  19488                                                  \n",
       "19  33153                                                  \n",
       "20  26161                                                  \n",
       "21  85820                                                  \n",
       "22  52838                                                  \n",
       "23  28283                                                  \n",
       "24  24756                                                  \n",
       "25  42857                                                  \n",
       "26  22879                                                  \n",
       "27  16983                                                  \n",
       "28  29072                                                  \n",
       "29  17359                                                  \n",
       "30  13124                                                  \n",
       "⋮   ⋮                                                      \n",
       "133 34867                                                  \n",
       "134 22421                                                  \n",
       "135 16777                                                  \n",
       "136 24420                                                  \n",
       "137 17003                                                  \n",
       "138 12647                                                  \n",
       "139 19969                                                  \n",
       "140 13699                                                  \n",
       "141 12627                                                  \n",
       "142 16774                                                  \n",
       "143 13917                                                  \n",
       "144 14180                                                  \n",
       "145 15740                                                  \n",
       "146 18559                                                  \n",
       "147 33635                                                  \n",
       "148 16800                                                  \n",
       "149 44776                                                  \n",
       "150 64045                                                  \n",
       "151 65201                                                  \n",
       "152 17000                                                  \n",
       "153 17564                                                  \n",
       "154 26508                                                  \n",
       "155 24029                                                  \n",
       "156 69198                                                  \n",
       "157 47533                                                  \n",
       "158 21752                                                  \n",
       "159 19065                                                  \n",
       "160 33118                                                  \n",
       "161 21209                                                  \n",
       "162 16008                                                  \n",
       "    Persentase Penduduk Miskin (P0) (%)\n",
       "1    7.73                              \n",
       "2    7.34                              \n",
       "3   10.55                              \n",
       "4    6.80                              \n",
       "5   10.42                              \n",
       "6   10.73                              \n",
       "7    7.72                              \n",
       "8   12.76                              \n",
       "9   12.01                              \n",
       "10  11.94                              \n",
       "11  10.14                              \n",
       "12  12.77                              \n",
       "13   9.75                              \n",
       "14   8.70                              \n",
       "15   8.44                              \n",
       "16   5.01                              \n",
       "17  10.82                              \n",
       "18   9.32                              \n",
       "19   7.10                              \n",
       "20   8.02                              \n",
       "21   4.25                              \n",
       "22   9.82                              \n",
       "23   4.43                              \n",
       "24   2.53                              \n",
       "25   5.11                              \n",
       "26  12.72                              \n",
       "27   6.73                              \n",
       "28   8.13                              \n",
       "29   7.70                              \n",
       "30  11.18                              \n",
       "⋮   ⋮                                  \n",
       "133  4.94                              \n",
       "134 12.71                              \n",
       "135  5.70                              \n",
       "136  8.57                              \n",
       "137  8.04                              \n",
       "138 11.41                              \n",
       "139  7.36                              \n",
       "140 11.27                              \n",
       "141 10.84                              \n",
       "142  8.20                              \n",
       "143 13.27                              \n",
       "144 12.97                              \n",
       "145 12.60                              \n",
       "146 10.53                              \n",
       "147 13.67                              \n",
       "148 10.77                              \n",
       "149  9.06                              \n",
       "150 10.25                              \n",
       "151  4.73                              \n",
       "152 11.49                              \n",
       "153 10.00                              \n",
       "154  7.11                              \n",
       "155  8.48                              \n",
       "156  4.17                              \n",
       "157  9.66                              \n",
       "158  4.79                              \n",
       "159  2.34                              \n",
       "160  5.76                              \n",
       "161 14.80                              \n",
       "162  7.06                              \n",
       "    [Metode Baru] Pengeluaran per Kapita Disesuaikan (Ribu Rupiah/Orang/Tahun)\n",
       "1   10860                                                                     \n",
       "2    9210                                                                     \n",
       "3    8244                                                                     \n",
       "4   10588                                                                     \n",
       "5    8227                                                                     \n",
       "6    8177                                                                     \n",
       "7    9428                                                                     \n",
       "8    9620                                                                     \n",
       "9   10791                                                                     \n",
       "10   9950                                                                     \n",
       "11  10776                                                                     \n",
       "12  10166                                                                     \n",
       "13  11294                                                                     \n",
       "14  12193                                                                     \n",
       "15  11927                                                                     \n",
       "16  11757                                                                     \n",
       "17   9044                                                                     \n",
       "18   9389                                                                     \n",
       "19  12058                                                                     \n",
       "20  11229                                                                     \n",
       "21  17639                                                                     \n",
       "22  12087                                                                     \n",
       "23  16239                                                                     \n",
       "24  15926                                                                     \n",
       "25  12500                                                                     \n",
       "26  10578                                                                     \n",
       "27  10967                                                                     \n",
       "28  10410                                                                     \n",
       "29   8850                                                                     \n",
       "30   8052                                                                     \n",
       "⋮   ⋮                                                                         \n",
       "133 11921                                                                     \n",
       "134  9855                                                                     \n",
       "135 10329                                                                     \n",
       "136  9901                                                                     \n",
       "137  8263                                                                     \n",
       "138  7300                                                                     \n",
       "139  9854                                                                     \n",
       "140  7270                                                                     \n",
       "141  7250                                                                     \n",
       "142  8658                                                                     \n",
       "143  8736                                                                     \n",
       "144  9650                                                                     \n",
       "145  8833                                                                     \n",
       "146  9569                                                                     \n",
       "147  9014                                                                     \n",
       "148 10206                                                                     \n",
       "149 10941                                                                     \n",
       "150 10703                                                                     \n",
       "151 10790                                                                     \n",
       "152  8002                                                                     \n",
       "153  8588                                                                     \n",
       "154 10940                                                                     \n",
       "155 10188                                                                     \n",
       "156 16033                                                                     \n",
       "157 11100                                                                     \n",
       "158 15378                                                                     \n",
       "159 14727                                                                     \n",
       "160 11353                                                                     \n",
       "161  9497                                                                     \n",
       "162  9987                                                                     \n",
       "    Jumlah Angkatan Kerja (Orang) Jumlah Penduduk yang Bekerja (Orang)\n",
       "1   2897332                       2589167                             \n",
       "2   1313905                       1211763                             \n",
       "3   1222589                       1119786                             \n",
       "4   1808799                       1682510                             \n",
       "5   1330353                       1229218                             \n",
       "6    940713                        901466                             \n",
       "7    664523                        639600                             \n",
       "8    530825                        478750                             \n",
       "9   1110529                       1020411                             \n",
       "10   644128                        617320                             \n",
       "11   609471                        562416                             \n",
       "12   952841                        890992                             \n",
       "13   868132                        800701                             \n",
       "14   472075                        430788                             \n",
       "15  1195947                       1077939                             \n",
       "16  2006507                       1799668                             \n",
       "17   819559                        740639                             \n",
       "18   260761                        256684                             \n",
       "19   556541                        496570                             \n",
       "20   159618                        145522                             \n",
       "21  1435635                       1298537                             \n",
       "22   163639                        149860                             \n",
       "23  1592545                       1452223                             \n",
       "24  1258739                       1160313                             \n",
       "25   320574                        286038                             \n",
       "26   347063                        324099                             \n",
       "27    94831                         89588                             \n",
       "28  2786372                       2445768                             \n",
       "29  1222156                       1105875                             \n",
       "30  1175885                       1066323                             \n",
       "⋮   ⋮                             ⋮                                   \n",
       "133  297539                        273955                             \n",
       "134  308343                        287233                             \n",
       "135   90439                         85113                             \n",
       "136 2600121                       2351753                             \n",
       "137 1123546                       1037532                             \n",
       "138  941358                        846258                             \n",
       "139 1649064                       1584391                             \n",
       "140 1133248                       1044137                             \n",
       "141  816033                        762133                             \n",
       "142  634932                        602123                             \n",
       "143  462403                        425700                             \n",
       "144  974469                        880807                             \n",
       "145  599365                        569252                             \n",
       "146  544805                        505827                             \n",
       "147  816531                        746020                             \n",
       "148  793666                        724308                             \n",
       "149  432117                        392747                             \n",
       "150 1117545                       1010828                             \n",
       "151 1572155                       1399743                             \n",
       "152  740957                        671847                             \n",
       "153  243702                        235561                             \n",
       "154  495824                        448386                             \n",
       "155  142285                        130909                             \n",
       "156 1219398                       1116529                             \n",
       "157  156814                        142246                             \n",
       "158 1396946                       1266692                             \n",
       "159 1085426                       1009401                             \n",
       "160  297050                        272017                             \n",
       "161  311874                        290396                             \n",
       "162   89369                         84032                             \n",
       "    Tingkat Partisipasi Angkatan Kerja (%)\n",
       "1   63.75                                 \n",
       "2   69.11                                 \n",
       "3   69.98                                 \n",
       "4   63.64                                 \n",
       "5   68.84                                 \n",
       "6   67.83                                 \n",
       "7   68.47                                 \n",
       "8   61.80                                 \n",
       "9   65.53                                 \n",
       "10  66.21                                 \n",
       "11  64.63                                 \n",
       "12  69.08                                 \n",
       "13  68.87                                 \n",
       "14  65.21                                 \n",
       "15  65.51                                 \n",
       "16  65.41                                 \n",
       "17  64.37                                 \n",
       "18  79.92                                 \n",
       "19  64.21                                 \n",
       "20  62.48                                 \n",
       "21  69.42                                 \n",
       "22  65.42                                 \n",
       "23  65.33                                 \n",
       "24  63.35                                 \n",
       "25  67.22                                 \n",
       "26  65.99                                 \n",
       "27  63.76                                 \n",
       "28  62.55                                 \n",
       "29  64.93                                 \n",
       "30  67.98                                 \n",
       "⋮   ⋮                                     \n",
       "133 64.49                                 \n",
       "134 62.75                                 \n",
       "135 65.09                                 \n",
       "136 64.07                                 \n",
       "137 63.75                                 \n",
       "138 58.28                                 \n",
       "139 62.81                                 \n",
       "140 62.92                                 \n",
       "141 63.56                                 \n",
       "142 70.10                                 \n",
       "143 57.69                                 \n",
       "144 61.25                                 \n",
       "145 66.11                                 \n",
       "146 62.06                                 \n",
       "147 63.33                                 \n",
       "148 66.60                                 \n",
       "149 63.16                                 \n",
       "150 64.94                                 \n",
       "151 61.26                                 \n",
       "152 61.73                                 \n",
       "153 79.88                                 \n",
       "154 61.13                                 \n",
       "155 59.24                                 \n",
       "156 63.11                                 \n",
       "157 66.45                                 \n",
       "158 64.35                                 \n",
       "159 64.04                                 \n",
       "160 65.33                                 \n",
       "161 63.88                                 \n",
       "162 64.78                                 \n",
       "    Persentase Tingkat Pengangguran Terbuka (%)\n",
       "1   10.64                                      \n",
       "2    7.77                                      \n",
       "3    8.41                                      \n",
       "4    6.98                                      \n",
       "5    7.60                                      \n",
       "6    4.17                                      \n",
       "7    3.75                                      \n",
       "8    9.81                                      \n",
       "9    8.11                                      \n",
       "10   4.16                                      \n",
       "11   7.72                                      \n",
       "12   6.49                                      \n",
       "13   7.77                                      \n",
       "14   8.75                                      \n",
       "15   9.87                                      \n",
       "16  10.31                                      \n",
       "17   9.63                                      \n",
       "18   1.56                                      \n",
       "19  10.78                                      \n",
       "20   8.83                                      \n",
       "21   9.55                                      \n",
       "22   8.42                                      \n",
       "23   8.81                                      \n",
       "24   7.82                                      \n",
       "25  10.77                                      \n",
       "26   6.62                                      \n",
       "27   5.53                                      \n",
       "28  12.22                                      \n",
       "29   9.51                                      \n",
       "30   9.32                                      \n",
       "⋮   ⋮                                          \n",
       "133  7.93                                      \n",
       "134  6.85                                      \n",
       "135  5.89                                      \n",
       "136  9.55                                      \n",
       "137  7.66                                      \n",
       "138 10.10                                      \n",
       "139  3.92                                      \n",
       "140  7.86                                      \n",
       "141  6.61                                      \n",
       "142  5.17                                      \n",
       "143  7.94                                      \n",
       "144  9.61                                      \n",
       "145  5.02                                      \n",
       "146  7.15                                      \n",
       "147  8.64                                      \n",
       "148  8.74                                      \n",
       "149  9.11                                      \n",
       "150  9.55                                      \n",
       "151 10.97                                      \n",
       "152  9.33                                      \n",
       "153  3.34                                      \n",
       "154  9.57                                      \n",
       "155  8.00                                      \n",
       "156  8.44                                      \n",
       "157  9.29                                      \n",
       "158  9.32                                      \n",
       "159  7.00                                      \n",
       "160  8.43                                      \n",
       "161  6.89                                      \n",
       "162  5.97                                      \n",
       "    [Metode Baru] Rata-rata Lama Sekolah (Tahun)\n",
       "1    8.34                                       \n",
       "2    7.11                                       \n",
       "3    7.20                                       \n",
       "4    9.08                                       \n",
       "5    7.83                                       \n",
       "6    7.73                                       \n",
       "7    8.00                                       \n",
       "8    7.88                                       \n",
       "9    7.40                                       \n",
       "10   7.49                                       \n",
       "11   8.72                                       \n",
       "12   6.83                                       \n",
       "13   7.20                                       \n",
       "14   8.11                                       \n",
       "15   7.96                                       \n",
       "16   9.53                                       \n",
       "17   8.22                                       \n",
       "18   8.03                                       \n",
       "19  10.63                                       \n",
       "20  10.14                                       \n",
       "21  11.00                                       \n",
       "22  10.33                                       \n",
       "23  11.44                                       \n",
       "24  11.47                                       \n",
       "25  11.21                                       \n",
       "26   9.53                                       \n",
       "27   8.78                                       \n",
       "28   8.31                                       \n",
       "29   7.10                                       \n",
       "30   7.19                                       \n",
       "⋮   ⋮                                           \n",
       "133 10.94                                       \n",
       "134  9.04                                       \n",
       "135  8.60                                       \n",
       "136  7.84                                       \n",
       "137  6.79                                       \n",
       "138  6.92                                       \n",
       "139  8.51                                       \n",
       "140  7.28                                       \n",
       "141  7.12                                       \n",
       "142  7.59                                       \n",
       "143  7.35                                       \n",
       "144  6.61                                       \n",
       "145  6.90                                       \n",
       "146  7.98                                       \n",
       "147  5.97                                       \n",
       "148  6.83                                       \n",
       "149  7.74                                       \n",
       "150  7.34                                       \n",
       "151  8.82                                       \n",
       "152  7.74                                       \n",
       "153  7.37                                       \n",
       "154 10.29                                       \n",
       "155  9.52                                       \n",
       "156 10.59                                       \n",
       "157  9.88                                       \n",
       "158 10.93                                       \n",
       "159 10.84                                       \n",
       "160 10.93                                       \n",
       "161  9.03                                       \n",
       "162  8.59                                       "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "path = \"/kaggle/input/data-semifinal-sac-ipb-23/Data Semifinal.xlsx\"\n",
    "data = read_excel(path)\n",
    "data"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "47f29483",
   "metadata": {
    "papermill": {
     "duration": 0.011509,
     "end_time": "2023-05-14T08:05:01.574346",
     "exception": false,
     "start_time": "2023-05-14T08:05:01.562837",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# Preprocessing & EDA"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d950703a",
   "metadata": {
    "papermill": {
     "duration": 0.011227,
     "end_time": "2023-05-14T08:05:01.596857",
     "exception": false,
     "start_time": "2023-05-14T08:05:01.585630",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Ubah Nama Kolom"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "bc179694",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:01.622029Z",
     "iopub.status.busy": "2023-05-14T08:05:01.620776Z",
     "iopub.status.idle": "2023-05-14T08:05:01.634588Z",
     "shell.execute_reply": "2023-05-14T08:05:01.633355Z"
    },
    "papermill": {
     "duration": 0.028142,
     "end_time": "2023-05-14T08:05:01.636132",
     "exception": false,
     "start_time": "2023-05-14T08:05:01.607990",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'No'</li><li>'Kode Kabupaten/Kota'</li><li>'Nama Kabupaten/Kota'</li><li>'Tahun'</li><li>'Latitude'</li><li>'Longitude'</li><li>'Persentase Bayi Stunting (%)'</li><li>'Persentase Rumah Tangga Sanitasi Layak (%)'</li><li>'Jumlah Rumah Tangga dengan Perilaku Hidup Bersih dan Sehat (PHBS) (Rumah tangga)'</li><li>'Angka Harapan Hidup (Tahun)'</li><li>'Produk Domestik Regional Bruto Per Kapita (Ribu Rupiah)'</li><li>'Persentase Penduduk Miskin (P0) (%)'</li><li>'[Metode Baru] Pengeluaran per Kapita Disesuaikan (Ribu Rupiah/Orang/Tahun)'</li><li>'Jumlah Angkatan Kerja (Orang)'</li><li>'Jumlah Penduduk yang Bekerja (Orang)'</li><li>'Tingkat Partisipasi Angkatan Kerja (%)'</li><li>'Persentase Tingkat Pengangguran Terbuka (%)'</li><li>'[Metode Baru] Rata-rata Lama Sekolah (Tahun)'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'No'\n",
       "\\item 'Kode Kabupaten/Kota'\n",
       "\\item 'Nama Kabupaten/Kota'\n",
       "\\item 'Tahun'\n",
       "\\item 'Latitude'\n",
       "\\item 'Longitude'\n",
       "\\item 'Persentase Bayi Stunting (\\%)'\n",
       "\\item 'Persentase Rumah Tangga Sanitasi Layak (\\%)'\n",
       "\\item 'Jumlah Rumah Tangga dengan Perilaku Hidup Bersih dan Sehat (PHBS) (Rumah tangga)'\n",
       "\\item 'Angka Harapan Hidup (Tahun)'\n",
       "\\item 'Produk Domestik Regional Bruto Per Kapita (Ribu Rupiah)'\n",
       "\\item 'Persentase Penduduk Miskin (P0) (\\%)'\n",
       "\\item '{[}Metode Baru{]} Pengeluaran per Kapita Disesuaikan (Ribu Rupiah/Orang/Tahun)'\n",
       "\\item 'Jumlah Angkatan Kerja (Orang)'\n",
       "\\item 'Jumlah Penduduk yang Bekerja (Orang)'\n",
       "\\item 'Tingkat Partisipasi Angkatan Kerja (\\%)'\n",
       "\\item 'Persentase Tingkat Pengangguran Terbuka (\\%)'\n",
       "\\item '{[}Metode Baru{]} Rata-rata Lama Sekolah (Tahun)'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'No'\n",
       "2. 'Kode Kabupaten/Kota'\n",
       "3. 'Nama Kabupaten/Kota'\n",
       "4. 'Tahun'\n",
       "5. 'Latitude'\n",
       "6. 'Longitude'\n",
       "7. 'Persentase Bayi Stunting (%)'\n",
       "8. 'Persentase Rumah Tangga Sanitasi Layak (%)'\n",
       "9. 'Jumlah Rumah Tangga dengan Perilaku Hidup Bersih dan Sehat (PHBS) (Rumah tangga)'\n",
       "10. 'Angka Harapan Hidup (Tahun)'\n",
       "11. 'Produk Domestik Regional Bruto Per Kapita (Ribu Rupiah)'\n",
       "12. 'Persentase Penduduk Miskin (P0) (%)'\n",
       "13. '[Metode Baru] Pengeluaran per Kapita Disesuaikan (Ribu Rupiah/Orang/Tahun)'\n",
       "14. 'Jumlah Angkatan Kerja (Orang)'\n",
       "15. 'Jumlah Penduduk yang Bekerja (Orang)'\n",
       "16. 'Tingkat Partisipasi Angkatan Kerja (%)'\n",
       "17. 'Persentase Tingkat Pengangguran Terbuka (%)'\n",
       "18. '[Metode Baru] Rata-rata Lama Sekolah (Tahun)'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"No\"                                                                              \n",
       " [2] \"Kode Kabupaten/Kota\"                                                             \n",
       " [3] \"Nama Kabupaten/Kota\"                                                             \n",
       " [4] \"Tahun\"                                                                           \n",
       " [5] \"Latitude\"                                                                        \n",
       " [6] \"Longitude\"                                                                       \n",
       " [7] \"Persentase Bayi Stunting (%)\"                                                    \n",
       " [8] \"Persentase Rumah Tangga Sanitasi Layak (%)\"                                      \n",
       " [9] \"Jumlah Rumah Tangga dengan Perilaku Hidup Bersih dan Sehat (PHBS) (Rumah tangga)\"\n",
       "[10] \"Angka Harapan Hidup (Tahun)\"                                                     \n",
       "[11] \"Produk Domestik Regional Bruto Per Kapita (Ribu Rupiah)\"                         \n",
       "[12] \"Persentase Penduduk Miskin (P0) (%)\"                                             \n",
       "[13] \"[Metode Baru] Pengeluaran per Kapita Disesuaikan (Ribu Rupiah/Orang/Tahun)\"      \n",
       "[14] \"Jumlah Angkatan Kerja (Orang)\"                                                   \n",
       "[15] \"Jumlah Penduduk yang Bekerja (Orang)\"                                            \n",
       "[16] \"Tingkat Partisipasi Angkatan Kerja (%)\"                                          \n",
       "[17] \"Persentase Tingkat Pengangguran Terbuka (%)\"                                     \n",
       "[18] \"[Metode Baru] Rata-rata Lama Sekolah (Tahun)\"                                    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "colnames(data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "a524d37b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:01.661659Z",
     "iopub.status.busy": "2023-05-14T08:05:01.660436Z",
     "iopub.status.idle": "2023-05-14T08:05:01.690343Z",
     "shell.execute_reply": "2023-05-14T08:05:01.689058Z"
    },
    "papermill": {
     "duration": 0.044206,
     "end_time": "2023-05-14T08:05:01.691909",
     "exception": false,
     "start_time": "2023-05-14T08:05:01.647703",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 18</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>No</th><th scope=col>Kode</th><th scope=col>Daerah</th><th scope=col>Tahun</th><th scope=col>Latitude</th><th scope=col>Longitude</th><th scope=col>Stunting</th><th scope=col>Sanitasi</th><th scope=col>PHBS</th><th scope=col>AHH</th><th scope=col>PDRB</th><th scope=col>Miskin</th><th scope=col>Pengeluaran</th><th scope=col>Angkatan_Kerja</th><th scope=col>Penduduk_Bekerja</th><th scope=col>TPAK</th><th scope=col>TPT</th><th scope=col>RLS</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>1</td><td>3201</td><td>KABUPATEN BOGOR      </td><td>2022</td><td>-6.479679</td><td>106.8250</td><td>NA</td><td>NA</td><td>NA</td><td>71.63</td><td>30173</td><td> 7.73</td><td>10860</td><td>2897332</td><td>2589167</td><td>63.75</td><td>10.64</td><td>8.34</td></tr>\n",
       "\t<tr><td>2</td><td>3202</td><td>KABUPATEN SUKABUMI   </td><td>2022</td><td>-6.915727</td><td>106.9326</td><td>NA</td><td>NA</td><td>NA</td><td>71.50</td><td>17953</td><td> 7.34</td><td> 9210</td><td>1313905</td><td>1211763</td><td>69.11</td><td> 7.77</td><td>7.11</td></tr>\n",
       "\t<tr><td>3</td><td>3203</td><td>KABUPATEN CIANJUR    </td><td>2022</td><td>-6.822558</td><td>107.1395</td><td>NA</td><td>NA</td><td>NA</td><td>70.56</td><td>13590</td><td>10.55</td><td> 8244</td><td>1222589</td><td>1119786</td><td>69.98</td><td> 8.41</td><td>7.20</td></tr>\n",
       "\t<tr><td>4</td><td>3204</td><td>KABUPATEN BANDUNG    </td><td>2022</td><td>-7.012851</td><td>107.5286</td><td>NA</td><td>NA</td><td>NA</td><td>73.98</td><td>23782</td><td> 6.80</td><td>10588</td><td>1808799</td><td>1682510</td><td>63.64</td><td> 6.98</td><td>9.08</td></tr>\n",
       "\t<tr><td>5</td><td>3205</td><td>KABUPATEN GARUT      </td><td>2022</td><td>-7.202988</td><td>107.8856</td><td>NA</td><td>NA</td><td>NA</td><td>71.74</td><td>15991</td><td>10.42</td><td> 8227</td><td>1330353</td><td>1229218</td><td>68.84</td><td> 7.60</td><td>7.83</td></tr>\n",
       "\t<tr><td>6</td><td>3206</td><td>KABUPATEN TASIKMALAYA</td><td>2022</td><td>-7.361212</td><td>108.1125</td><td>NA</td><td>NA</td><td>NA</td><td>69.93</td><td>13829</td><td>10.73</td><td> 8177</td><td> 940713</td><td> 901466</td><td>67.83</td><td> 4.17</td><td>7.73</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 18\n",
       "\\begin{tabular}{llllllllllllllllll}\n",
       " No & Kode & Daerah & Tahun & Latitude & Longitude & Stunting & Sanitasi & PHBS & AHH & PDRB & Miskin & Pengeluaran & Angkatan\\_Kerja & Penduduk\\_Bekerja & TPAK & TPT & RLS\\\\\n",
       " <dbl> & <dbl> & <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 1 & 3201 & KABUPATEN BOGOR       & 2022 & -6.479679 & 106.8250 & NA & NA & NA & 71.63 & 30173 &  7.73 & 10860 & 2897332 & 2589167 & 63.75 & 10.64 & 8.34\\\\\n",
       "\t 2 & 3202 & KABUPATEN SUKABUMI    & 2022 & -6.915727 & 106.9326 & NA & NA & NA & 71.50 & 17953 &  7.34 &  9210 & 1313905 & 1211763 & 69.11 &  7.77 & 7.11\\\\\n",
       "\t 3 & 3203 & KABUPATEN CIANJUR     & 2022 & -6.822558 & 107.1395 & NA & NA & NA & 70.56 & 13590 & 10.55 &  8244 & 1222589 & 1119786 & 69.98 &  8.41 & 7.20\\\\\n",
       "\t 4 & 3204 & KABUPATEN BANDUNG     & 2022 & -7.012851 & 107.5286 & NA & NA & NA & 73.98 & 23782 &  6.80 & 10588 & 1808799 & 1682510 & 63.64 &  6.98 & 9.08\\\\\n",
       "\t 5 & 3205 & KABUPATEN GARUT       & 2022 & -7.202988 & 107.8856 & NA & NA & NA & 71.74 & 15991 & 10.42 &  8227 & 1330353 & 1229218 & 68.84 &  7.60 & 7.83\\\\\n",
       "\t 6 & 3206 & KABUPATEN TASIKMALAYA & 2022 & -7.361212 & 108.1125 & NA & NA & NA & 69.93 & 13829 & 10.73 &  8177 &  940713 &  901466 & 67.83 &  4.17 & 7.73\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 18\n",
       "\n",
       "| No &lt;dbl&gt; | Kode &lt;dbl&gt; | Daerah &lt;chr&gt; | Tahun &lt;dbl&gt; | Latitude &lt;dbl&gt; | Longitude &lt;dbl&gt; | Stunting &lt;dbl&gt; | Sanitasi &lt;dbl&gt; | PHBS &lt;dbl&gt; | AHH &lt;dbl&gt; | PDRB &lt;dbl&gt; | Miskin &lt;dbl&gt; | Pengeluaran &lt;dbl&gt; | Angkatan_Kerja &lt;dbl&gt; | Penduduk_Bekerja &lt;dbl&gt; | TPAK &lt;dbl&gt; | TPT &lt;dbl&gt; | RLS &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 3201 | KABUPATEN BOGOR       | 2022 | -6.479679 | 106.8250 | NA | NA | NA | 71.63 | 30173 |  7.73 | 10860 | 2897332 | 2589167 | 63.75 | 10.64 | 8.34 |\n",
       "| 2 | 3202 | KABUPATEN SUKABUMI    | 2022 | -6.915727 | 106.9326 | NA | NA | NA | 71.50 | 17953 |  7.34 |  9210 | 1313905 | 1211763 | 69.11 |  7.77 | 7.11 |\n",
       "| 3 | 3203 | KABUPATEN CIANJUR     | 2022 | -6.822558 | 107.1395 | NA | NA | NA | 70.56 | 13590 | 10.55 |  8244 | 1222589 | 1119786 | 69.98 |  8.41 | 7.20 |\n",
       "| 4 | 3204 | KABUPATEN BANDUNG     | 2022 | -7.012851 | 107.5286 | NA | NA | NA | 73.98 | 23782 |  6.80 | 10588 | 1808799 | 1682510 | 63.64 |  6.98 | 9.08 |\n",
       "| 5 | 3205 | KABUPATEN GARUT       | 2022 | -7.202988 | 107.8856 | NA | NA | NA | 71.74 | 15991 | 10.42 |  8227 | 1330353 | 1229218 | 68.84 |  7.60 | 7.83 |\n",
       "| 6 | 3206 | KABUPATEN TASIKMALAYA | 2022 | -7.361212 | 108.1125 | NA | NA | NA | 69.93 | 13829 | 10.73 |  8177 |  940713 |  901466 | 67.83 |  4.17 | 7.73 |\n",
       "\n"
      ],
      "text/plain": [
       "  No Kode Daerah                Tahun Latitude  Longitude Stunting Sanitasi\n",
       "1 1  3201 KABUPATEN BOGOR       2022  -6.479679 106.8250  NA       NA      \n",
       "2 2  3202 KABUPATEN SUKABUMI    2022  -6.915727 106.9326  NA       NA      \n",
       "3 3  3203 KABUPATEN CIANJUR     2022  -6.822558 107.1395  NA       NA      \n",
       "4 4  3204 KABUPATEN BANDUNG     2022  -7.012851 107.5286  NA       NA      \n",
       "5 5  3205 KABUPATEN GARUT       2022  -7.202988 107.8856  NA       NA      \n",
       "6 6  3206 KABUPATEN TASIKMALAYA 2022  -7.361212 108.1125  NA       NA      \n",
       "  PHBS AHH   PDRB  Miskin Pengeluaran Angkatan_Kerja Penduduk_Bekerja TPAK \n",
       "1 NA   71.63 30173  7.73  10860       2897332        2589167          63.75\n",
       "2 NA   71.50 17953  7.34   9210       1313905        1211763          69.11\n",
       "3 NA   70.56 13590 10.55   8244       1222589        1119786          69.98\n",
       "4 NA   73.98 23782  6.80  10588       1808799        1682510          63.64\n",
       "5 NA   71.74 15991 10.42   8227       1330353        1229218          68.84\n",
       "6 NA   69.93 13829 10.73   8177        940713         901466          67.83\n",
       "  TPT   RLS \n",
       "1 10.64 8.34\n",
       "2  7.77 7.11\n",
       "3  8.41 7.20\n",
       "4  6.98 9.08\n",
       "5  7.60 7.83\n",
       "6  4.17 7.73"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Ubah Nama Kolom\n",
    "nama_kol = c(\"No\", \"Kode\", \"Daerah\", \"Tahun\", 'Latitude', 'Longitude', 'Stunting', 'Sanitasi', 'PHBS', 'AHH', 'PDRB', 'Miskin', \n",
    "             'Pengeluaran', 'Angkatan_Kerja', 'Penduduk_Bekerja', 'TPAK', 'TPT', 'RLS')\n",
    "names(data) <- nama_kol\n",
    "head(data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "218a0465",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:01.718254Z",
     "iopub.status.busy": "2023-05-14T08:05:01.717067Z",
     "iopub.status.idle": "2023-05-14T08:05:01.742271Z",
     "shell.execute_reply": "2023-05-14T08:05:01.741059Z"
    },
    "papermill": {
     "duration": 0.03987,
     "end_time": "2023-05-14T08:05:01.743813",
     "exception": false,
     "start_time": "2023-05-14T08:05:01.703943",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Daerah</th><th scope=col>Tahun</th><th scope=col>Stunting</th><th scope=col>AHH</th><th scope=col>PDRB</th><th scope=col>Miskin</th><th scope=col>Pengeluaran</th><th scope=col>Angkatan_Kerja</th><th scope=col>Penduduk_Bekerja</th><th scope=col>TPAK</th><th scope=col>TPT</th><th scope=col>RLS</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>KABUPATEN BOGOR      </td><td>2022</td><td>NA</td><td>71.63</td><td>30173</td><td> 7.73</td><td>10860</td><td>2897332</td><td>2589167</td><td>63.75</td><td>10.64</td><td>8.34</td></tr>\n",
       "\t<tr><td>KABUPATEN SUKABUMI   </td><td>2022</td><td>NA</td><td>71.50</td><td>17953</td><td> 7.34</td><td> 9210</td><td>1313905</td><td>1211763</td><td>69.11</td><td> 7.77</td><td>7.11</td></tr>\n",
       "\t<tr><td>KABUPATEN CIANJUR    </td><td>2022</td><td>NA</td><td>70.56</td><td>13590</td><td>10.55</td><td> 8244</td><td>1222589</td><td>1119786</td><td>69.98</td><td> 8.41</td><td>7.20</td></tr>\n",
       "\t<tr><td>KABUPATEN BANDUNG    </td><td>2022</td><td>NA</td><td>73.98</td><td>23782</td><td> 6.80</td><td>10588</td><td>1808799</td><td>1682510</td><td>63.64</td><td> 6.98</td><td>9.08</td></tr>\n",
       "\t<tr><td>KABUPATEN GARUT      </td><td>2022</td><td>NA</td><td>71.74</td><td>15991</td><td>10.42</td><td> 8227</td><td>1330353</td><td>1229218</td><td>68.84</td><td> 7.60</td><td>7.83</td></tr>\n",
       "\t<tr><td>KABUPATEN TASIKMALAYA</td><td>2022</td><td>NA</td><td>69.93</td><td>13829</td><td>10.73</td><td> 8177</td><td> 940713</td><td> 901466</td><td>67.83</td><td> 4.17</td><td>7.73</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 12\n",
       "\\begin{tabular}{llllllllllll}\n",
       " Daerah & Tahun & Stunting & AHH & PDRB & Miskin & Pengeluaran & Angkatan\\_Kerja & Penduduk\\_Bekerja & TPAK & TPT & RLS\\\\\n",
       " <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t KABUPATEN BOGOR       & 2022 & NA & 71.63 & 30173 &  7.73 & 10860 & 2897332 & 2589167 & 63.75 & 10.64 & 8.34\\\\\n",
       "\t KABUPATEN SUKABUMI    & 2022 & NA & 71.50 & 17953 &  7.34 &  9210 & 1313905 & 1211763 & 69.11 &  7.77 & 7.11\\\\\n",
       "\t KABUPATEN CIANJUR     & 2022 & NA & 70.56 & 13590 & 10.55 &  8244 & 1222589 & 1119786 & 69.98 &  8.41 & 7.20\\\\\n",
       "\t KABUPATEN BANDUNG     & 2022 & NA & 73.98 & 23782 &  6.80 & 10588 & 1808799 & 1682510 & 63.64 &  6.98 & 9.08\\\\\n",
       "\t KABUPATEN GARUT       & 2022 & NA & 71.74 & 15991 & 10.42 &  8227 & 1330353 & 1229218 & 68.84 &  7.60 & 7.83\\\\\n",
       "\t KABUPATEN TASIKMALAYA & 2022 & NA & 69.93 & 13829 & 10.73 &  8177 &  940713 &  901466 & 67.83 &  4.17 & 7.73\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 12\n",
       "\n",
       "| Daerah &lt;chr&gt; | Tahun &lt;dbl&gt; | Stunting &lt;dbl&gt; | AHH &lt;dbl&gt; | PDRB &lt;dbl&gt; | Miskin &lt;dbl&gt; | Pengeluaran &lt;dbl&gt; | Angkatan_Kerja &lt;dbl&gt; | Penduduk_Bekerja &lt;dbl&gt; | TPAK &lt;dbl&gt; | TPT &lt;dbl&gt; | RLS &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| KABUPATEN BOGOR       | 2022 | NA | 71.63 | 30173 |  7.73 | 10860 | 2897332 | 2589167 | 63.75 | 10.64 | 8.34 |\n",
       "| KABUPATEN SUKABUMI    | 2022 | NA | 71.50 | 17953 |  7.34 |  9210 | 1313905 | 1211763 | 69.11 |  7.77 | 7.11 |\n",
       "| KABUPATEN CIANJUR     | 2022 | NA | 70.56 | 13590 | 10.55 |  8244 | 1222589 | 1119786 | 69.98 |  8.41 | 7.20 |\n",
       "| KABUPATEN BANDUNG     | 2022 | NA | 73.98 | 23782 |  6.80 | 10588 | 1808799 | 1682510 | 63.64 |  6.98 | 9.08 |\n",
       "| KABUPATEN GARUT       | 2022 | NA | 71.74 | 15991 | 10.42 |  8227 | 1330353 | 1229218 | 68.84 |  7.60 | 7.83 |\n",
       "| KABUPATEN TASIKMALAYA | 2022 | NA | 69.93 | 13829 | 10.73 |  8177 |  940713 |  901466 | 67.83 |  4.17 | 7.73 |\n",
       "\n"
      ],
      "text/plain": [
       "  Daerah                Tahun Stunting AHH   PDRB  Miskin Pengeluaran\n",
       "1 KABUPATEN BOGOR       2022  NA       71.63 30173  7.73  10860      \n",
       "2 KABUPATEN SUKABUMI    2022  NA       71.50 17953  7.34   9210      \n",
       "3 KABUPATEN CIANJUR     2022  NA       70.56 13590 10.55   8244      \n",
       "4 KABUPATEN BANDUNG     2022  NA       73.98 23782  6.80  10588      \n",
       "5 KABUPATEN GARUT       2022  NA       71.74 15991 10.42   8227      \n",
       "6 KABUPATEN TASIKMALAYA 2022  NA       69.93 13829 10.73   8177      \n",
       "  Angkatan_Kerja Penduduk_Bekerja TPAK  TPT   RLS \n",
       "1 2897332        2589167          63.75 10.64 8.34\n",
       "2 1313905        1211763          69.11  7.77 7.11\n",
       "3 1222589        1119786          69.98  8.41 7.20\n",
       "4 1808799        1682510          63.64  6.98 9.08\n",
       "5 1330353        1229218          68.84  7.60 7.83\n",
       "6  940713         901466          67.83  4.17 7.73"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "keluar_kol = c(\"No\", \"Kode\", \"Latitude\", \"Longitude\", \"Sanitasi\", \"PHBS\")\n",
    "data1 = data[, !(colnames(data) %in% keluar_kol)]\n",
    "head(data1)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e2014e8b",
   "metadata": {
    "papermill": {
     "duration": 0.011983,
     "end_time": "2023-05-14T08:05:01.768128",
     "exception": false,
     "start_time": "2023-05-14T08:05:01.756145",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Pengecekan & Imputasi Missing Value<br>\n",
    "Data Stunting 2022"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "46a9398f",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:01.794883Z",
     "iopub.status.busy": "2023-05-14T08:05:01.793599Z",
     "iopub.status.idle": "2023-05-14T08:05:01.925734Z",
     "shell.execute_reply": "2023-05-14T08:05:01.924532Z"
    },
    "papermill": {
     "duration": 0.147225,
     "end_time": "2023-05-14T08:05:01.927374",
     "exception": false,
     "start_time": "2023-05-14T08:05:01.780149",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22m`summarise()` has grouped output by 'key'. You can override using the `.groups`\n",
      "argument.\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A grouped_df: 1 × 3</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>key</th><th scope=col>num.missing</th><th scope=col>Persen</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Stunting</td><td>27</td><td>0.1666667</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A grouped\\_df: 1 × 3\n",
       "\\begin{tabular}{lll}\n",
       " key & num.missing & Persen\\\\\n",
       " <chr> & <int> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Stunting & 27 & 0.1666667\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A grouped_df: 1 × 3\n",
       "\n",
       "| key &lt;chr&gt; | num.missing &lt;int&gt; | Persen &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| Stunting | 27 | 0.1666667 |\n",
       "\n"
      ],
      "text/plain": [
       "  key      num.missing Persen   \n",
       "1 Stunting 27          0.1666667"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "missing.values <- data1[3:12] %>%\n",
    "    gather(key = \"key\", value = \"val\") %>%\n",
    "    mutate(is.missing = is.na(val)) %>%\n",
    "    group_by(key, is.missing) %>%\n",
    "    summarise(num.missing = n()) %>%\n",
    "    filter(is.missing==T) %>%\n",
    "    select(-is.missing) %>%\n",
    "    arrange(desc(num.missing)) \n",
    "\n",
    "missing.values[\"Persen\"] = missing.values$num.missing/nrow(data1)\n",
    "missing.values"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "f443c9fc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:01.953705Z",
     "iopub.status.busy": "2023-05-14T08:05:01.952655Z",
     "iopub.status.idle": "2023-05-14T08:05:01.961006Z",
     "shell.execute_reply": "2023-05-14T08:05:01.959814Z"
    },
    "papermill": {
     "duration": 0.022955,
     "end_time": "2023-05-14T08:05:01.962629",
     "exception": false,
     "start_time": "2023-05-14T08:05:01.939674",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# unique(data$Daerah)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "d5aca844",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:01.989061Z",
     "iopub.status.busy": "2023-05-14T08:05:01.987975Z",
     "iopub.status.idle": "2023-05-14T08:05:02.026710Z",
     "shell.execute_reply": "2023-05-14T08:05:02.025567Z"
    },
    "papermill": {
     "duration": 0.053594,
     "end_time": "2023-05-14T08:05:02.028342",
     "exception": false,
     "start_time": "2023-05-14T08:05:01.974748",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 27 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Daerah</th><th scope=col>Tahun</th><th scope=col>Stunting</th><th scope=col>AHH</th><th scope=col>PDRB</th><th scope=col>Miskin</th><th scope=col>Pengeluaran</th><th scope=col>Angkatan_Kerja</th><th scope=col>Penduduk_Bekerja</th><th scope=col>TPAK</th><th scope=col>TPT</th><th scope=col>RLS</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>KABUPATEN BOGOR        </td><td>2022</td><td>24.9</td><td>71.63</td><td>30173</td><td> 7.73</td><td>10860</td><td>2897332</td><td>2589167</td><td>63.75</td><td>10.64</td><td> 8.34</td></tr>\n",
       "\t<tr><td>KABUPATEN SUKABUMI     </td><td>2022</td><td>27.5</td><td>71.50</td><td>17953</td><td> 7.34</td><td> 9210</td><td>1313905</td><td>1211763</td><td>69.11</td><td> 7.77</td><td> 7.11</td></tr>\n",
       "\t<tr><td>KABUPATEN CIANJUR      </td><td>2022</td><td>13.6</td><td>70.56</td><td>13590</td><td>10.55</td><td> 8244</td><td>1222589</td><td>1119786</td><td>69.98</td><td> 8.41</td><td> 7.20</td></tr>\n",
       "\t<tr><td>KABUPATEN BANDUNG      </td><td>2022</td><td>25.0</td><td>73.98</td><td>23782</td><td> 6.80</td><td>10588</td><td>1808799</td><td>1682510</td><td>63.64</td><td> 6.98</td><td> 9.08</td></tr>\n",
       "\t<tr><td>KABUPATEN GARUT        </td><td>2022</td><td>23.6</td><td>71.74</td><td>15991</td><td>10.42</td><td> 8227</td><td>1330353</td><td>1229218</td><td>68.84</td><td> 7.60</td><td> 7.83</td></tr>\n",
       "\t<tr><td>KABUPATEN TASIKMALAYA  </td><td>2022</td><td>27.2</td><td>69.93</td><td>13829</td><td>10.73</td><td> 8177</td><td> 940713</td><td> 901466</td><td>67.83</td><td> 4.17</td><td> 7.73</td></tr>\n",
       "\t<tr><td>KABUPATEN CIAMIS       </td><td>2022</td><td>18.6</td><td>72.30</td><td>19169</td><td> 7.72</td><td> 9428</td><td> 664523</td><td> 639600</td><td>68.47</td><td> 3.75</td><td> 8.00</td></tr>\n",
       "\t<tr><td>KABUPATEN KUNINGAN     </td><td>2022</td><td>19.4</td><td>74.03</td><td>15426</td><td>12.76</td><td> 9620</td><td> 530825</td><td> 478750</td><td>61.80</td><td> 9.81</td><td> 7.88</td></tr>\n",
       "\t<tr><td>KABUPATEN CIREBON      </td><td>2022</td><td>18.6</td><td>72.46</td><td>15342</td><td>12.01</td><td>10791</td><td>1110529</td><td>1020411</td><td>65.53</td><td> 8.11</td><td> 7.40</td></tr>\n",
       "\t<tr><td>KABUPATEN MAJALENGKA   </td><td>2022</td><td>24.3</td><td>70.74</td><td>18197</td><td>11.94</td><td> 9950</td><td> 644128</td><td> 617320</td><td>66.21</td><td> 4.16</td><td> 7.49</td></tr>\n",
       "\t<tr><td>KABUPATEN SUMEDANG     </td><td>2022</td><td>27.6</td><td>72.87</td><td>21972</td><td>10.14</td><td>10776</td><td> 609471</td><td> 562416</td><td>64.63</td><td> 7.72</td><td> 8.72</td></tr>\n",
       "\t<tr><td>KABUPATEN INDRAMAYU    </td><td>2022</td><td>21.1</td><td>72.14</td><td>32727</td><td>12.77</td><td>10166</td><td> 952841</td><td> 890992</td><td>69.08</td><td> 6.49</td><td> 6.83</td></tr>\n",
       "\t<tr><td>KABUPATEN SUBANG       </td><td>2022</td><td>15.7</td><td>72.91</td><td>18580</td><td> 9.75</td><td>11294</td><td> 868132</td><td> 800701</td><td>68.87</td><td> 7.77</td><td> 7.20</td></tr>\n",
       "\t<tr><td>KABUPATEN PURWAKARTA   </td><td>2022</td><td>21.8</td><td>71.44</td><td>47924</td><td> 8.70</td><td>12193</td><td> 472075</td><td> 430788</td><td>65.21</td><td> 8.75</td><td> 8.11</td></tr>\n",
       "\t<tr><td>KABUPATEN KARAWANG     </td><td>2022</td><td>14.0</td><td>72.60</td><td>70840</td><td> 8.44</td><td>11927</td><td>1195947</td><td>1077939</td><td>65.51</td><td> 9.87</td><td> 7.96</td></tr>\n",
       "\t<tr><td>KABUPATEN BEKASI       </td><td>2022</td><td>17.8</td><td>74.02</td><td>82472</td><td> 5.01</td><td>11757</td><td>2006507</td><td>1799668</td><td>65.41</td><td>10.31</td><td> 9.53</td></tr>\n",
       "\t<tr><td>KABUPATEN BANDUNG BARAT</td><td>2022</td><td>27.3</td><td>72.78</td><td>18080</td><td>10.82</td><td> 9044</td><td> 819559</td><td> 740639</td><td>64.37</td><td> 9.63</td><td> 8.22</td></tr>\n",
       "\t<tr><td>KABUPATEN PANGANDARAN  </td><td>2022</td><td>20.0</td><td>71.86</td><td>19488</td><td> 9.32</td><td> 9389</td><td> 260761</td><td> 256684</td><td>79.92</td><td> 1.56</td><td> 8.03</td></tr>\n",
       "\t<tr><td>KOTA BOGOR             </td><td>2022</td><td>24.9</td><td>74.11</td><td>33153</td><td> 7.10</td><td>12058</td><td> 556541</td><td> 496570</td><td>64.21</td><td>10.78</td><td>10.63</td></tr>\n",
       "\t<tr><td>KOTA SUKABUMI          </td><td>2022</td><td>19.2</td><td>72.82</td><td>26161</td><td> 8.02</td><td>11229</td><td> 159618</td><td> 145522</td><td>62.48</td><td> 8.83</td><td>10.14</td></tr>\n",
       "\t<tr><td>KOTA BANDUNG           </td><td>2022</td><td>19.4</td><td>74.69</td><td>85820</td><td> 4.25</td><td>17639</td><td>1435635</td><td>1298537</td><td>69.42</td><td> 9.55</td><td>11.00</td></tr>\n",
       "\t<tr><td>KOTA CIREBON           </td><td>2022</td><td>17.0</td><td>72.72</td><td>52838</td><td> 9.82</td><td>12087</td><td> 163639</td><td> 149860</td><td>65.42</td><td> 8.42</td><td>10.33</td></tr>\n",
       "\t<tr><td>KOTA BEKASI            </td><td>2022</td><td> 6.0</td><td>75.44</td><td>28283</td><td> 4.43</td><td>16239</td><td>1592545</td><td>1452223</td><td>65.33</td><td> 8.81</td><td>11.44</td></tr>\n",
       "\t<tr><td>KOTA DEPOK             </td><td>2022</td><td>12.6</td><td>75.00</td><td>24756</td><td> 2.53</td><td>15926</td><td>1258739</td><td>1160313</td><td>63.35</td><td> 7.82</td><td>11.47</td></tr>\n",
       "\t<tr><td>KOTA CIMAHI            </td><td>2022</td><td>16.4</td><td>74.46</td><td>42857</td><td> 5.11</td><td>12500</td><td> 320574</td><td> 286038</td><td>67.22</td><td>10.77</td><td>11.21</td></tr>\n",
       "\t<tr><td>KOTA TASIKMALAYA       </td><td>2022</td><td>22.4</td><td>72.62</td><td>22879</td><td>12.72</td><td>10578</td><td> 347063</td><td> 324099</td><td>65.99</td><td> 6.62</td><td> 9.53</td></tr>\n",
       "\t<tr><td>KOTA BANJAR            </td><td>2022</td><td>19.3</td><td>71.46</td><td>16983</td><td> 6.73</td><td>10967</td><td>  94831</td><td>  89588</td><td>63.76</td><td> 5.53</td><td> 8.78</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 27 × 12\n",
       "\\begin{tabular}{llllllllllll}\n",
       " Daerah & Tahun & Stunting & AHH & PDRB & Miskin & Pengeluaran & Angkatan\\_Kerja & Penduduk\\_Bekerja & TPAK & TPT & RLS\\\\\n",
       " <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t KABUPATEN BOGOR         & 2022 & 24.9 & 71.63 & 30173 &  7.73 & 10860 & 2897332 & 2589167 & 63.75 & 10.64 &  8.34\\\\\n",
       "\t KABUPATEN SUKABUMI      & 2022 & 27.5 & 71.50 & 17953 &  7.34 &  9210 & 1313905 & 1211763 & 69.11 &  7.77 &  7.11\\\\\n",
       "\t KABUPATEN CIANJUR       & 2022 & 13.6 & 70.56 & 13590 & 10.55 &  8244 & 1222589 & 1119786 & 69.98 &  8.41 &  7.20\\\\\n",
       "\t KABUPATEN BANDUNG       & 2022 & 25.0 & 73.98 & 23782 &  6.80 & 10588 & 1808799 & 1682510 & 63.64 &  6.98 &  9.08\\\\\n",
       "\t KABUPATEN GARUT         & 2022 & 23.6 & 71.74 & 15991 & 10.42 &  8227 & 1330353 & 1229218 & 68.84 &  7.60 &  7.83\\\\\n",
       "\t KABUPATEN TASIKMALAYA   & 2022 & 27.2 & 69.93 & 13829 & 10.73 &  8177 &  940713 &  901466 & 67.83 &  4.17 &  7.73\\\\\n",
       "\t KABUPATEN CIAMIS        & 2022 & 18.6 & 72.30 & 19169 &  7.72 &  9428 &  664523 &  639600 & 68.47 &  3.75 &  8.00\\\\\n",
       "\t KABUPATEN KUNINGAN      & 2022 & 19.4 & 74.03 & 15426 & 12.76 &  9620 &  530825 &  478750 & 61.80 &  9.81 &  7.88\\\\\n",
       "\t KABUPATEN CIREBON       & 2022 & 18.6 & 72.46 & 15342 & 12.01 & 10791 & 1110529 & 1020411 & 65.53 &  8.11 &  7.40\\\\\n",
       "\t KABUPATEN MAJALENGKA    & 2022 & 24.3 & 70.74 & 18197 & 11.94 &  9950 &  644128 &  617320 & 66.21 &  4.16 &  7.49\\\\\n",
       "\t KABUPATEN SUMEDANG      & 2022 & 27.6 & 72.87 & 21972 & 10.14 & 10776 &  609471 &  562416 & 64.63 &  7.72 &  8.72\\\\\n",
       "\t KABUPATEN INDRAMAYU     & 2022 & 21.1 & 72.14 & 32727 & 12.77 & 10166 &  952841 &  890992 & 69.08 &  6.49 &  6.83\\\\\n",
       "\t KABUPATEN SUBANG        & 2022 & 15.7 & 72.91 & 18580 &  9.75 & 11294 &  868132 &  800701 & 68.87 &  7.77 &  7.20\\\\\n",
       "\t KABUPATEN PURWAKARTA    & 2022 & 21.8 & 71.44 & 47924 &  8.70 & 12193 &  472075 &  430788 & 65.21 &  8.75 &  8.11\\\\\n",
       "\t KABUPATEN KARAWANG      & 2022 & 14.0 & 72.60 & 70840 &  8.44 & 11927 & 1195947 & 1077939 & 65.51 &  9.87 &  7.96\\\\\n",
       "\t KABUPATEN BEKASI        & 2022 & 17.8 & 74.02 & 82472 &  5.01 & 11757 & 2006507 & 1799668 & 65.41 & 10.31 &  9.53\\\\\n",
       "\t KABUPATEN BANDUNG BARAT & 2022 & 27.3 & 72.78 & 18080 & 10.82 &  9044 &  819559 &  740639 & 64.37 &  9.63 &  8.22\\\\\n",
       "\t KABUPATEN PANGANDARAN   & 2022 & 20.0 & 71.86 & 19488 &  9.32 &  9389 &  260761 &  256684 & 79.92 &  1.56 &  8.03\\\\\n",
       "\t KOTA BOGOR              & 2022 & 24.9 & 74.11 & 33153 &  7.10 & 12058 &  556541 &  496570 & 64.21 & 10.78 & 10.63\\\\\n",
       "\t KOTA SUKABUMI           & 2022 & 19.2 & 72.82 & 26161 &  8.02 & 11229 &  159618 &  145522 & 62.48 &  8.83 & 10.14\\\\\n",
       "\t KOTA BANDUNG            & 2022 & 19.4 & 74.69 & 85820 &  4.25 & 17639 & 1435635 & 1298537 & 69.42 &  9.55 & 11.00\\\\\n",
       "\t KOTA CIREBON            & 2022 & 17.0 & 72.72 & 52838 &  9.82 & 12087 &  163639 &  149860 & 65.42 &  8.42 & 10.33\\\\\n",
       "\t KOTA BEKASI             & 2022 &  6.0 & 75.44 & 28283 &  4.43 & 16239 & 1592545 & 1452223 & 65.33 &  8.81 & 11.44\\\\\n",
       "\t KOTA DEPOK              & 2022 & 12.6 & 75.00 & 24756 &  2.53 & 15926 & 1258739 & 1160313 & 63.35 &  7.82 & 11.47\\\\\n",
       "\t KOTA CIMAHI             & 2022 & 16.4 & 74.46 & 42857 &  5.11 & 12500 &  320574 &  286038 & 67.22 & 10.77 & 11.21\\\\\n",
       "\t KOTA TASIKMALAYA        & 2022 & 22.4 & 72.62 & 22879 & 12.72 & 10578 &  347063 &  324099 & 65.99 &  6.62 &  9.53\\\\\n",
       "\t KOTA BANJAR             & 2022 & 19.3 & 71.46 & 16983 &  6.73 & 10967 &   94831 &   89588 & 63.76 &  5.53 &  8.78\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 27 × 12\n",
       "\n",
       "| Daerah &lt;chr&gt; | Tahun &lt;dbl&gt; | Stunting &lt;dbl&gt; | AHH &lt;dbl&gt; | PDRB &lt;dbl&gt; | Miskin &lt;dbl&gt; | Pengeluaran &lt;dbl&gt; | Angkatan_Kerja &lt;dbl&gt; | Penduduk_Bekerja &lt;dbl&gt; | TPAK &lt;dbl&gt; | TPT &lt;dbl&gt; | RLS &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| KABUPATEN BOGOR         | 2022 | 24.9 | 71.63 | 30173 |  7.73 | 10860 | 2897332 | 2589167 | 63.75 | 10.64 |  8.34 |\n",
       "| KABUPATEN SUKABUMI      | 2022 | 27.5 | 71.50 | 17953 |  7.34 |  9210 | 1313905 | 1211763 | 69.11 |  7.77 |  7.11 |\n",
       "| KABUPATEN CIANJUR       | 2022 | 13.6 | 70.56 | 13590 | 10.55 |  8244 | 1222589 | 1119786 | 69.98 |  8.41 |  7.20 |\n",
       "| KABUPATEN BANDUNG       | 2022 | 25.0 | 73.98 | 23782 |  6.80 | 10588 | 1808799 | 1682510 | 63.64 |  6.98 |  9.08 |\n",
       "| KABUPATEN GARUT         | 2022 | 23.6 | 71.74 | 15991 | 10.42 |  8227 | 1330353 | 1229218 | 68.84 |  7.60 |  7.83 |\n",
       "| KABUPATEN TASIKMALAYA   | 2022 | 27.2 | 69.93 | 13829 | 10.73 |  8177 |  940713 |  901466 | 67.83 |  4.17 |  7.73 |\n",
       "| KABUPATEN CIAMIS        | 2022 | 18.6 | 72.30 | 19169 |  7.72 |  9428 |  664523 |  639600 | 68.47 |  3.75 |  8.00 |\n",
       "| KABUPATEN KUNINGAN      | 2022 | 19.4 | 74.03 | 15426 | 12.76 |  9620 |  530825 |  478750 | 61.80 |  9.81 |  7.88 |\n",
       "| KABUPATEN CIREBON       | 2022 | 18.6 | 72.46 | 15342 | 12.01 | 10791 | 1110529 | 1020411 | 65.53 |  8.11 |  7.40 |\n",
       "| KABUPATEN MAJALENGKA    | 2022 | 24.3 | 70.74 | 18197 | 11.94 |  9950 |  644128 |  617320 | 66.21 |  4.16 |  7.49 |\n",
       "| KABUPATEN SUMEDANG      | 2022 | 27.6 | 72.87 | 21972 | 10.14 | 10776 |  609471 |  562416 | 64.63 |  7.72 |  8.72 |\n",
       "| KABUPATEN INDRAMAYU     | 2022 | 21.1 | 72.14 | 32727 | 12.77 | 10166 |  952841 |  890992 | 69.08 |  6.49 |  6.83 |\n",
       "| KABUPATEN SUBANG        | 2022 | 15.7 | 72.91 | 18580 |  9.75 | 11294 |  868132 |  800701 | 68.87 |  7.77 |  7.20 |\n",
       "| KABUPATEN PURWAKARTA    | 2022 | 21.8 | 71.44 | 47924 |  8.70 | 12193 |  472075 |  430788 | 65.21 |  8.75 |  8.11 |\n",
       "| KABUPATEN KARAWANG      | 2022 | 14.0 | 72.60 | 70840 |  8.44 | 11927 | 1195947 | 1077939 | 65.51 |  9.87 |  7.96 |\n",
       "| KABUPATEN BEKASI        | 2022 | 17.8 | 74.02 | 82472 |  5.01 | 11757 | 2006507 | 1799668 | 65.41 | 10.31 |  9.53 |\n",
       "| KABUPATEN BANDUNG BARAT | 2022 | 27.3 | 72.78 | 18080 | 10.82 |  9044 |  819559 |  740639 | 64.37 |  9.63 |  8.22 |\n",
       "| KABUPATEN PANGANDARAN   | 2022 | 20.0 | 71.86 | 19488 |  9.32 |  9389 |  260761 |  256684 | 79.92 |  1.56 |  8.03 |\n",
       "| KOTA BOGOR              | 2022 | 24.9 | 74.11 | 33153 |  7.10 | 12058 |  556541 |  496570 | 64.21 | 10.78 | 10.63 |\n",
       "| KOTA SUKABUMI           | 2022 | 19.2 | 72.82 | 26161 |  8.02 | 11229 |  159618 |  145522 | 62.48 |  8.83 | 10.14 |\n",
       "| KOTA BANDUNG            | 2022 | 19.4 | 74.69 | 85820 |  4.25 | 17639 | 1435635 | 1298537 | 69.42 |  9.55 | 11.00 |\n",
       "| KOTA CIREBON            | 2022 | 17.0 | 72.72 | 52838 |  9.82 | 12087 |  163639 |  149860 | 65.42 |  8.42 | 10.33 |\n",
       "| KOTA BEKASI             | 2022 |  6.0 | 75.44 | 28283 |  4.43 | 16239 | 1592545 | 1452223 | 65.33 |  8.81 | 11.44 |\n",
       "| KOTA DEPOK              | 2022 | 12.6 | 75.00 | 24756 |  2.53 | 15926 | 1258739 | 1160313 | 63.35 |  7.82 | 11.47 |\n",
       "| KOTA CIMAHI             | 2022 | 16.4 | 74.46 | 42857 |  5.11 | 12500 |  320574 |  286038 | 67.22 | 10.77 | 11.21 |\n",
       "| KOTA TASIKMALAYA        | 2022 | 22.4 | 72.62 | 22879 | 12.72 | 10578 |  347063 |  324099 | 65.99 |  6.62 |  9.53 |\n",
       "| KOTA BANJAR             | 2022 | 19.3 | 71.46 | 16983 |  6.73 | 10967 |   94831 |   89588 | 63.76 |  5.53 |  8.78 |\n",
       "\n"
      ],
      "text/plain": [
       "   Daerah                  Tahun Stunting AHH   PDRB  Miskin Pengeluaran\n",
       "1  KABUPATEN BOGOR         2022  24.9     71.63 30173  7.73  10860      \n",
       "2  KABUPATEN SUKABUMI      2022  27.5     71.50 17953  7.34   9210      \n",
       "3  KABUPATEN CIANJUR       2022  13.6     70.56 13590 10.55   8244      \n",
       "4  KABUPATEN BANDUNG       2022  25.0     73.98 23782  6.80  10588      \n",
       "5  KABUPATEN GARUT         2022  23.6     71.74 15991 10.42   8227      \n",
       "6  KABUPATEN TASIKMALAYA   2022  27.2     69.93 13829 10.73   8177      \n",
       "7  KABUPATEN CIAMIS        2022  18.6     72.30 19169  7.72   9428      \n",
       "8  KABUPATEN KUNINGAN      2022  19.4     74.03 15426 12.76   9620      \n",
       "9  KABUPATEN CIREBON       2022  18.6     72.46 15342 12.01  10791      \n",
       "10 KABUPATEN MAJALENGKA    2022  24.3     70.74 18197 11.94   9950      \n",
       "11 KABUPATEN SUMEDANG      2022  27.6     72.87 21972 10.14  10776      \n",
       "12 KABUPATEN INDRAMAYU     2022  21.1     72.14 32727 12.77  10166      \n",
       "13 KABUPATEN SUBANG        2022  15.7     72.91 18580  9.75  11294      \n",
       "14 KABUPATEN PURWAKARTA    2022  21.8     71.44 47924  8.70  12193      \n",
       "15 KABUPATEN KARAWANG      2022  14.0     72.60 70840  8.44  11927      \n",
       "16 KABUPATEN BEKASI        2022  17.8     74.02 82472  5.01  11757      \n",
       "17 KABUPATEN BANDUNG BARAT 2022  27.3     72.78 18080 10.82   9044      \n",
       "18 KABUPATEN PANGANDARAN   2022  20.0     71.86 19488  9.32   9389      \n",
       "19 KOTA BOGOR              2022  24.9     74.11 33153  7.10  12058      \n",
       "20 KOTA SUKABUMI           2022  19.2     72.82 26161  8.02  11229      \n",
       "21 KOTA BANDUNG            2022  19.4     74.69 85820  4.25  17639      \n",
       "22 KOTA CIREBON            2022  17.0     72.72 52838  9.82  12087      \n",
       "23 KOTA BEKASI             2022   6.0     75.44 28283  4.43  16239      \n",
       "24 KOTA DEPOK              2022  12.6     75.00 24756  2.53  15926      \n",
       "25 KOTA CIMAHI             2022  16.4     74.46 42857  5.11  12500      \n",
       "26 KOTA TASIKMALAYA        2022  22.4     72.62 22879 12.72  10578      \n",
       "27 KOTA BANJAR             2022  19.3     71.46 16983  6.73  10967      \n",
       "   Angkatan_Kerja Penduduk_Bekerja TPAK  TPT   RLS  \n",
       "1  2897332        2589167          63.75 10.64  8.34\n",
       "2  1313905        1211763          69.11  7.77  7.11\n",
       "3  1222589        1119786          69.98  8.41  7.20\n",
       "4  1808799        1682510          63.64  6.98  9.08\n",
       "5  1330353        1229218          68.84  7.60  7.83\n",
       "6   940713         901466          67.83  4.17  7.73\n",
       "7   664523         639600          68.47  3.75  8.00\n",
       "8   530825         478750          61.80  9.81  7.88\n",
       "9  1110529        1020411          65.53  8.11  7.40\n",
       "10  644128         617320          66.21  4.16  7.49\n",
       "11  609471         562416          64.63  7.72  8.72\n",
       "12  952841         890992          69.08  6.49  6.83\n",
       "13  868132         800701          68.87  7.77  7.20\n",
       "14  472075         430788          65.21  8.75  8.11\n",
       "15 1195947        1077939          65.51  9.87  7.96\n",
       "16 2006507        1799668          65.41 10.31  9.53\n",
       "17  819559         740639          64.37  9.63  8.22\n",
       "18  260761         256684          79.92  1.56  8.03\n",
       "19  556541         496570          64.21 10.78 10.63\n",
       "20  159618         145522          62.48  8.83 10.14\n",
       "21 1435635        1298537          69.42  9.55 11.00\n",
       "22  163639         149860          65.42  8.42 10.33\n",
       "23 1592545        1452223          65.33  8.81 11.44\n",
       "24 1258739        1160313          63.35  7.82 11.47\n",
       "25  320574         286038          67.22 10.77 11.21\n",
       "26  347063         324099          65.99  6.62  9.53\n",
       "27   94831          89588          63.76  5.53  8.78"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Imputasi Data Stunting 2022\n",
    "stunt22 = c(24.9, 27.5, 13.6, 25, 23.6, 27.2, 18.6, 19.4, 18.6, 24.3,\n",
    "           27.6, 21.1, 15.7, 21.8, 14, 17.8, 27.3, 20, 24.9, 19.2,\n",
    "           19.4, 17, 6, 12.6, 16.4, 22.4, 19.3)\n",
    "data1$Stunting[1:27] = stunt22\n",
    "head(data1, 27)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "477f0bab",
   "metadata": {
    "papermill": {
     "duration": 0.012078,
     "end_time": "2023-05-14T08:05:02.053022",
     "exception": false,
     "start_time": "2023-05-14T08:05:02.040944",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Daerah, Tahun X TPT"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "07fea13e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:02.079624Z",
     "iopub.status.busy": "2023-05-14T08:05:02.078479Z",
     "iopub.status.idle": "2023-05-14T08:05:03.414843Z",
     "shell.execute_reply": "2023-05-14T08:05:03.412961Z"
    },
    "papermill": {
     "duration": 1.352172,
     "end_time": "2023-05-14T08:05:03.417313",
     "exception": false,
     "start_time": "2023-05-14T08:05:02.065141",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22mSaving 12.5 x 6.67 in image\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAACWAAAAWgCAIAAABVZ+/5AAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdfYwc530f8Jnd2b29vTve8XgnuJYBNRZdRhbrILWAOnaLQIWMQigJooFSOwYc\nWVYcJymcFHVEm4kjN1RQyiSrynVSuInbJAaal8JtQIVtgCCwaceXBC5hpo3dxkqkP/riWDqq\nonjvt7e3/WOtFS3LvKW4M7O7v8/nL93qIe/7zO4+N5zvPnNpp9NJAAAAAAAAgBgqZQcAAAAA\nAAAAiqMgBAAAAAAAgEAUhAAAAAAAABBIVvD3+7Ufv79x8pPvXJzsfvnMH//s+0792bUD3v/r\n/+Ef7G8UnAoAAAAAAACCKLIg7PzlF3/1d75+5Qc7nd5DV/70yuSBoz/1vjt7j7x+ql5gJAAA\nAAAAAIiloILwG3/4+Ed+eenZF7Ze9viz/+Pq3Bvf+ta33vmKfwoAAAAAAAAYrIJ+B+H8m+77\n8EdPnf3Yh172+H+7urX/e+faG1e/8eyVziv+SQAAAAAAAGBwCtpBWJ993cHZpL398l8ueGm1\ntfvFf/WPPvHnrU4nm1r8++/6qfcffVPv/z799NNnz57tffnggw+++c1vLiYwAAAAAAAAjKUi\nfwfhy7W3/+8LafWvz3/fx37jkdn21T/5z5/6F7/ykYk3fPo93z3XHbC6uvqlL32pN/7o0aO7\nu7slhX0FaZqmadrpdDqdQLsfK5VKkiQxZz1UL78CBJx1902dhJx1tDd1zFlbwIOIvJQlIWcd\n7U0dc9YW8CAiL2VJyFlHe1PHnLUFPAhLWdlZihNz1pGXspizHral7OrVq3Nzc2WnGFtlFoTV\n+q2f+cxnXvxq4ft/6MNP/v47Pvupr7zn7N/pPjQ7O3vPPff0xt9yyy2tVqvwmN9RrVZL03R3\nd3dnZ6fsLMWp1+tpmrbb7Xa7XXaWgqRpWq/XkyRpt9vDtj7mp1KpdH8k7OzsxPlBWK1WsyxL\nkmSolpq8ZVlWrVY7nU6oWcdcwCcmJpIksYCPvUqlUqvVkpALeLSlLOYC3n1TW8DHXvAFPNSb\nOuYC3j0XjTZrC3jZWQrSW8BDnYvGXMC756JJsFmHXcDDXkLZ2dmJcy46tAt4nJ+hpSizIPx2\nb75l8rPPL/e+vO222x599NHelysrKysrK2XkemWzs7OVSqXVaq2urpadpTjz8/Npmm5tbW1s\nbJSdpSCVSmV+fj5Jko2Nje3t7bLjFKRWq83OziZJsrq6GucH4eTkZPfyxFAtNXmbnp6uVqvt\ndjvUrOfm5gIu4N1z+s3Nzc3NzbKzFKS3gK+vr8f591u9Xu9enlhZWRmqc/pcxVzAZ2ZmYi7g\nWZZtb2+vra2VnaU43csToRbwarXavTyxtrYW51JUbwFfXV2Ns4A3m80sy3Z3d0MtZTMzMxMT\nEzs7O6FmvX///mq1GnMB39jY2NraKjtLQbIs6y7g6+vrcRbwiYmJ3hl42VmK02w2m81mtAV8\n37599Xq91WqFmnV3Ad/a2lpfXy87S0HSNO2dgQdcwNfW1nRycVRK/N5XnvylB3/kHz+z/WL3\n0Gl//q/W5974N0qMBAAAAAAAAOOtzIJw3+vfcWD9mQ/9/L+5+JUn/+Krf/qbjx//wtrMj/6I\nghAAAAAAAADyUuYtRivZwiO/9PO/+sl///Ff+JnNbN/rDx7+0OMnv3e6VmIkAAAAAAAAGG+F\nFoTV+uueeOKJax+Z2H/nj5345z9WZAgAAAAAAAAIrMxbjAIAAAAAAAAFUxACAAAAAABAIApC\nAAAAAAAACERBCAAAAAAAAIEoCAEAAAAAACAQBSEAAAAAAAAEoiAEAAAAAACAQBSEAAAAAAAA\nEIiCEAAAAAAAAAJREAIAAAAAAEAgCkIAAAAAAAAIREEIAAAAAAAAgSgIAQAAAAAAIBAFIQAA\nAAAAAASiIAQAAAAAAIBAFIQAAAAAAAAQiIIQAAAAAAAAAlEQAgAAAAAAQCAKQgAAAAAAAAhE\nQQgAAAAAAACBKAgBAAAAAAAgEAUhAAAAAAAABKIgBAAAAAAAgEAUhAAAAAAAABCIghAAAAAA\nAAACURACAAAAAABAIApCAAAAAAAACERBCAAAAAAAAIEoCAEAAAAAACAQBSEAAAAAAAAEoiAE\nAAAAAACAQBSEAAAAAAAAEIiCEAAAAAAAAAJREAIAAAAAAEAgCkIAAAAAAAAIREEIAAAAAAAA\ngSgIAQAAAAAAIBAFIQAAAAAAAASiIAQAAAAAAIBAFIQAAAAAAAAQiIIQAAAAAAAAAlEQAgAA\nAAAAQCAKQgAAAAAAAAhEQQgAAAAAAACBKAgBAAAAAAAgEAUhAAAAAAAABJKVHQAYUumFpT5H\nLh8+lGsSAAAAAABggOwgBAAAAAAAgEAUhAAAAAAAABCIghAAAAAAAAACURACAAAAAABAIApC\nAAAAAAAACERBCAAAAAAAAIEoCAEAAAAAACAQBSEAAAAAAAAEoiAEAAAAAACAQBSEAAAAAAAA\nEIiCEAAAAAAAAAJREAIAAAAAAEAgCkIAAAAAAAAIREEIAAAAAAAAgSgIAQAAAAAAIBAFIQAA\nAAAAAASiIAQAAAAAAIBAFIQAAAAAAAAQiIIQAAAAAAAAAlEQAgAAAAAAQCAKQgAAAAAAAAhE\nQQgAAAAAAACBKAgBAAAAAAAgEAUhAAAAAAAABKIgBAAAAAAAgEAUhAAAAAAAABCIghAAAAAA\nAAACURACAAAAAABAIApCAAAAAAAACERBCAAAAAAAAIEoCAEAAAAAACAQBSEAAAAAAAAEoiAE\nAAAAAACAQBSEAAAAAAAAEIiCEAAAAAAAAAJREAIAAAAAAEAgCkIAAAAAAAAIREEIAAAAAAAA\ngSgIAQAAAAAAIBAFIQAAAAAAAASiIAQAAAAAAIBAFIQAAAAAAAAQiIIQAAAAAAAAAlEQAgAA\nAAAAQCAKQgAAAAAAAAhEQQgAAAAAAACBKAgBAAAAAAAgEAUhAAAAAAAABKIgBAAAAAAAgEAU\nhAAAAAAAABCIghAAAAAAAAACURACAAAAAABAIApCAAAAAAAACERBCAAAAAAAAIEoCAEAAAAA\nACAQBSEAAAAAAAAEoiAEAAAAAACAQBSEAAAAAAAAEIiCEAAAAAAAAAJREAIAAAAAAEAgCkIA\nAAAAAAAIREEIAAAAAAAAgSgIAQAAAAAAIBAFIQAAAAAAAASiIAQAAAAAAIBAFIQAAAAAAAAQ\niIIQAAAAAAAAAlEQAgAAAAAAQCAKQgAAAAAAAAhEQQgAAAAAAACBKAgBAAAAAAAgEAUhAAAA\nAAAABJKVHQAAAAAAgFGSXljqZ9jy4UN5JwHg1bGDEAAAAAAAAAJREAIAAAAAAEAgCkIAAAAA\nAAAIREEIAAAAAAAAgSgIAQAAAAAAIBAFIQAAAAAAAASiIAQAAAAAAIBAFIQAAAAAAAAQiIIQ\nAAAAAAAAAlEQAgAAAAAAQCAKQgAAAAAAAAhEQQgAAAAAAACBKAgBAAAAAAAgEAUhAAAAAAAA\nBKIgBAAAAAAAgEAUhAAAAAAAABBIVnYAAAAAAADG0PFzC/0MO33sct5JAHgZOwgBAAAAAAAg\nEAUhAAAAAAAABKIgBAAAAAAAgEAUhAAAAAAAABCIghAAAAAAAAACURACAAAAAABAIApCAAAA\n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\ndp3cLQdd70bXycdHGQlR33t4NIZNb985esz4z7dXf/E4VvX8p2Utj+qawJIAAAAAAAAguSVy\nB2FBp2Ftysb9YurvLh0+qEVK2avPPPTC1vwpYwSEAAAkuVcXFNY5pveZ6+scAwAAANAAiQwI\nU9PbXnfn1N/fM/e26b8sTy/odMTRv/jttJ4HZSSwJAAAAAAAAEhuCb4HYVarHuMm3zAusUUA\nAAAAAABAZCTyHoQAAAAAAABAExMQAgAAAAAAQIQICAEAAAAAACBCBIQAAAAAAAAQIQJCAAAA\nAAAAiBABIQAAAAAAAESIgBAAAAAAAAAiREAIAAAAAAAAESIgBAAAAAAAgAgREAIAAAAAAECE\nCAgBAAAAAAAgQgSEAAAAAAAAECECQgAAAAAAAIgQASEAAAAAAABEiIAQAAAAAAAAIkRACAAA\nAAAAABEiIAQAAAAAAIAIERACAAAAAABAhAgIAQAAAAAAIEIEhAAAAAAAABAhAkIAAAAAAACI\nEAEhAAAAAAAARIiAEAAAAAAAACIkPdEFAMTHqwsKax+wKITBh/ZtmmIAAAAAAKDZsoMQAAAA\nAAAAIkRACAAAAAAAABEiIAQAAAAAAIAIERACAAAAAABAhAgIAQAAAAAAIEIEhAAAAAAAABAh\nAkIAAAAAAACIEAEhAAAAAAAAREh6ogsAAAAIIYTC4rPqNS5jViMXAgAAAEnODkIAAAAAAACI\nEAEhAAAAAAAARIiAEAAAAAAAACJEQAgAAAAAAAARIiAEAAAAAACACBEQAgAAAAAAQIQICAEA\nAAAAACBC0hNdAAAA8A0Ki8+qe1DGrMYvBAAAAEg2dhACAAAAAABAhAgIAQAAAAAAIEIEhAAA\nAAAAABAhAkIAAAAAAACIEAEhAAAAAAAARIiAEAAAAAAAACJEQAgAAAAAAAARIiAEAAAAAACA\nCBEQAgAAAAAAQIQICAEAAAAAACBCBIQAAAAAAAAQIQJCAAAAAAAAiBABIQAAAAAAAESIgBAA\nAAAAAAAiJD3RBQAAAADQQLmTy+scU3ZjdhNUAgDAAURACAAA+P0yAAAARIhLjAIAAAAAAECE\nCAgBAAAAAAAgQgSEAAAAAAAAECECQgAAAAAAAIgQASEAAAAAAABEiIAQAAAAAAAAIkRACAAA\nAAAAABEiIAQAAAAAAIAIERACAAAAAABAhAgIAQAAAAAAIEIEhAAAAAAAABAhAkIAAAAAAACI\nEAEhAAAAAAAARIiAEAAAAAAAACJEQAgAAAAAAAARIiAEAAAAAACACBEQAgAAAAAAQISkJ7qA\nOMufOa3OMQPDZUuPvKMJigEAAAAAAIDmxg5CAAAAAAAAiBABIQAAAAAAAESIgBAAAAAAAAAi\nREAIAAAAAAAAESIgBAAAAAAAgAgREAIAAAAAAECECAgBAAAAAAAgQgSEAAAAAAAAECECQgAA\nAAAAAIgQASEAAAAAAABEiIAQAAAAAAAAIiQ90QUAJK3cyeV1jim7MbsJKgEAAAAAgBp2EAIA\nAAAAAECECAgBAAAAAAAgQgSEAAAAAAAAECECQgAAAAAAAIgQASEAAAAAAABEiIAQAAAAAAAA\nIkRACAAAAAAAABEiIAQAAAAAAIAIERACAAAAAABAhAgIAQAAAAAAIEIEhAAAAAAAABAhAkIA\nAAAAAACIkPREFwAAACS5VxcU1mfYohAGH9q3sYsBAAAA7CAEAAAAAACACBEQAgAAAAAAQIQI\nCAEAAAAAACBCBIQAAAAAAAAQIQJCAAAAAAAAiBABIQAAAAAAAESIgBAAAAAAAAAiREAIAAAA\nAAAAESIgBAAAAAAAgAgREAIAAAAAAECECAgBAAAAAAAgQgSEAAAAAAAAECECQgAAAAAAAIgQ\nASEAAAAAAABEiIAQAAAAAAAAIkRACAAAAAAAABEiIAQAAAAAAIAISU90AQAAwAEsf+a0OscM\nDJctPfKOJigGAOD/s3fngVZVdf+A9x24zCBcVMARVNBUECdUBklSQRJFNMU5c84BNMw0e7W3\nnEU0ClBD5TUjo5yn11RmFVETM8SMTGUSmeHCHbjn98dVvMmQvj/u2bm/z/OXZ9+TfZfrnLXX\nXp+z1wYAvgx3EAIAAAAAAEAgAkIAAAAAAAAIREAIAAAAAAAAgQgIAQAAAAAAIBABIQAAAAAA\nAARSnHYBAAAAW9gVj7b6t++5+ZhP8lAJAAAA/AdyByEAAAAAAAAEIiAEAAAAAACAQASEAAAA\nAAAAEIiAEAAAAAAAAAIREAIAAAAAAEAgAkIAAAAAAAAIREAIAAAAAAAAgQgIAQAAAAAAIBAB\nIQAAAAAAAAQiIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAAAAhEQAgAAAAAAQCACQgAAAAAA\nAAhEQAgAAAAAAACBCAgBAAAAAAAgEAEhAAAAAAAABCIgBAAAAAAAgEAEhAAAAAAAABCIgBAA\nAAAAAAACERACAAAAAABAIAJCAAAAAAAACERACAAAAAAAAIEICAEAAAAAACAQASEAAAAAAAAE\nIiAEAAAAAACAQASEAAAAAAAAEIiAEAAAAAAAAAIREAIAAAAAAEAgAkIAAAAAAAAIREAIAAAA\nAAAAgQgIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAAAAhEQ\nAgAAAAAAQCACQgAAAAAAAAhEQAgAAAAAAACBCAgBAAAAAAAgEAEhAAAAAAAABCIgBAAAAAAA\ngEAEhAAAAAAAABCIgBAAAAAAAAACERACAAAAAABAIAJCAAAAAAAACERACAAAAAAAAIEICAEA\nAAAAACAQASEAAAAAAAAEIiAEAAAAAACAQASEAAAAAAAAEIiAEAAAAAAAAAIREAIAAAAAAEAg\nAkIAAAAAAAAIREAIAAAAAAAAgRSnXcBX0LBhw6ZNm27+PeX5KSU9rVq12vCgVmfPRpuchGx1\ntpucaHUtWp1JAVttAF8v201OtLqWr2+rN/WF/TK+vq3+kjLW11+GAXy9bDc50epatDp7DGW1\nBWx1tpucaHUtWp09hrJNWbx4cR4qCevrFBCWl5evWrVq8+9pmJ9S0rNs2bIND2p19my0yUnI\nVme7yYlW16LVmRSw1Qbw9bLd5ESra/n6tnpTX9gv4+vb6i8pY339ZRjA18t2kxOtrkWrs8dQ\nVlvAVme7yYlW16LV2WMo25RcLpeHSsL6OgWE1dXVVVVVaVeRspj/BQK2OmCTE62ORKvjCNjq\ngE1OtDqSjLU6Y83ZsgL+xwnY5ESrI9HqIAI2OdHqSLQ6joCtDtjkJGqr/6N4BiEAAAAAAAAE\nIiAEAAAAAACAQASEAAAAAAAAEIiAEAAAAAAAAAIREAIAAAAAAEAgAkIAAAAAAAAIREAIAAAA\nAAAAgQgIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAAAAhEQ\nAgAAAAAAQCACQgAAAAAAAAhEQAgAAAAAAACBCAgBAAAAAAAgEAEhAAAAAAAABCIgBAAAAAAA\ngEAEhAAAAAAAABCIgBAAAAAAAAACERACAAAAAABAIAJCAAAAAAAACERACAAAAAAAAIEICAEA\nAAAAACAQASEAAAAAAAAEIiAEAAAAAACAQASEAAAAAAAAEIiAEAAAAAAAAAIREAIAAAAAAEAg\nAkIAAAAAAAAIREAIAAAAAAAAgQgIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAIBABIQAAAAA\nAAAQiIAQAAAAAAAAAhEQAgAAAAAAQCACQgAAAAAAAAhEQAgAAAAAAACBCAgBAAAAAAAgEAEh\nAAAAAAAABCIgBAAAAAAAgEAEhAAAAAAAABCIgBAAAAAAAAACERACAAAAAABAIAJCAAAAAAAA\nCERACAAAAAAAAIEICAEAAAAAACAQASEAAAAAAAAEIiAEAAAAAACAQASEAAAAAAAAEIiAEAAA\nAAAAAAIREAIAAAAAAEAgAkIAAAAAAAAIREAIAAAAAAAAgQgIAQAAAAAAIBABIQAAAAAAAAQi\nIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAAAAhEQAgAAAAAAQCACQgAAAAAAAAhEQAgAAAAA\nAACBCAgBAAAAAAAgEAEhAAAAAAAABCIgBAAAAAAAgEAEhAAAAAAAABBIcdoFAAAApKDRj9Z+\nmbeV3dCgrisBAACAPHMHIQAAAAAAAAQiIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAAAAhEQ\nAgAAAAAAQCACQgAAAAAAAAhEQAgAAAAAAACBCAgBAAAAAAAgEAEhAAAAAAAABCIgBAAAAAAA\ngEAEhAAAAAAAABCIgBAAAAAAAAACERACAAAAAABAIAJCAAAAAAAACERACAAAAAAAAIEICAEA\nAAAAACAQASEAAAAAAAAEIiAEAAAAAACAQASEAAAAAAAAEIiAEAAAAAAAAAIREAIAAAAAAEAg\nAkIAAAAAAAAIREAIAAAAAAAAgQgIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAIBABIQAAAAA\nAAAQiIAQAAAAAAAAAhEQAgAAAAAAQCACQgAAAAAAAAhEQAgAAAAAAACBCAgBAAAAAAAgEAEh\nAAAAAAAABCIgBAAAAAAAgEAEhAAAAAAAABCIgBAAAAAAAAACERACAAAAAABAIAJCAAAAAAAA\nCERACAAAAAAAAIEICAEAAAAAACAQASEAAAAAAAAEIiAEAAAAAACAQASEAAAAAAAAEIiAEAAA\nAAAAAAIREAIAAAAAAEAgAkIAAAAAAAAIREAIAAAAAAAAgQgIAQAAAAAAIBABIQAAAAAAAAQi\nIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAAAAhEQAgAAAAAAQCACQgAAAAAAAAhEQAgAAAAA\nAACBCAgBAAAAAAAgEAEhAAAAAAAABCIgBAAAAAAAgEAEhAAAAAAAABCIgBAAAAAAAAACERAC\nAAAAAABAIAJCAAAAAAAACERACAAAAAAAAIEICAEAAAAAACAQASEAAAAAAAAEIiAEAAAAAACA\nQASEAAAAAAAAEIiAEAAAAAAAAAIREAIAAAAAAEAgAkIAAAAAAAAIREAIAAAAAAAAgQgIAQAA\nAAAAIBABIQAAAAAAAAQiIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAAAAhEQAgAAAAAAQCAC\nQgAAAAAAAAhEQAgAAAAAAACBCAgBAAAAAAAgEAEhAAAAAAAABCIgBAAAAAAAgEAEhAAAAAAA\nABCIgBAAAAAAAAACERACAAAAAABAIAJCAAAAAAAACERACAAAAAAAAIEICAEAAAAAACAQASEA\nAAAAAAAEIiAEAAAAAACAQASEAAAAAAAAEIiAEAAAAAAAAAIREAIAAAAAAEAgAkIAAAAAAAAI\nREAIAAAAAAAAgQgIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAA\nAAAAAhEQAgAAAAAAQCACQgAAAAAAAAhEQAgAAAAAAACBCAgBAAAAAAAgEAEhAAAAAAAABCIg\nBAAAAAAAgEAEhAAAAAAAABCIgBAAAAAAAAACERACAAAAAABAIAJCAAAAAAAACKQ47QKqJ4z7\n1eOTXv9wZdEee3U985LvtmtYlHZJAAAAAAAAkFkp30E45w8/vv13Lx183Dn/Nfj0Rn//09WX\n3Z1LtyAAAAAAAADItFQDwlzFsN/N2vW0nx3/rYP33K/H4Ju+v2ruU7+dvzrNkgAAAAAAACDT\n0gwIy5dP+mDtur6Hta15Wb9Fj85NSl6duDDFkgAAAAAAACDb0nwGYcXqmUmSfKPR5zXs2aj4\nf/+yfP3LOXPm3Hrrretfnn766fvtt9/m/53VW7rI/zTNmzff8KBWZ89Gm5yEbHW2m5xodS1a\nnUkBW20AXy/bTU60uhatzqSArTaAr5ftJidaXYtWZ4+hrLaArc52kxOtrkWrs8dQtikrVqzI\nQyVhpRkQVpevTpKkVb2i9Uda1SuqXFG5/uWqVaumT5++/uXRRx9dr169zf87y7d0kf9pNvpf\nQKuzZ1Mf9YCtznaTE62uRaszKWCrDeDrZbvJiVbXotWZFLDVBvD1st3kRKtr0ersMZTVFrDV\n2W5yotW1aHX2GMpIRUEul0vr/3vl3NtOuWDiXeMfaV3y6U6n484+6dltrrj3+n1rXn700Udj\nx45d//6jjjpq9913T6HQTSgpKSksLFy3bl1lZeW/f3dW1K9fv6CgoKqqqqqqKu1a8qSgoKB+\n/fpJklRUVFRXZ/tHG58rLCwsKSlJkqS8vDzFUSLPioqK6tWrl8vlysuzffL9F/Xq1SsqKqqu\nrq6oqEi7lvyJOYA3aNAgSZLKysp169alXUueGMDjDODFxcXFxcUG8AhqBvBQc9HEAB5mAK+Z\niyZJsnbt2rRryR8DeNq15E/AxYTEAG4Az7SYA3jMxQQDeNq15Ml/7GLC6tWrS0tL064is9K8\ng7Beo72TZOI7aypbl9SvOfLumqrme35+V+n2229/1VVXrX+5cuXKVatW5bvKTWvevHlhYWFl\nZeV/VFV1raSkpKCgoLy8fM2aNWnXkieFhYU1s9u1a9fGuX6rV69ezSlh9erVceb0DRs2rJnT\nh/pSN2nSpKioaN26daFavdVWWwUcwGvm9OXl5XGuWtcP4GvWrIlz/VZSUlIzgK9ateo/ak5f\npxo2bFizPBHqS920adPIA/jq1avTriV/apYnQg3gRUVFNQN4WVlZnKWokpKSmrno6tWr4wzg\njRo1Ki4urq6uDjWU1QzgVVVVoVpdE4vGHMDXrl0bJ0EpLi4OOIDXr18/4GJCzAG8WbNmJSUl\nMQfwioqKsrKytGvJk4KCgpgDeM1iQllZWZxYlMIU/78bbPXN7UqKnpq2qOZl5arXZ6ys2Peb\nrVMsCQAAAAAAALItzYAwKah3+fG7/+3X177w+rvz5rx1zzXDGm93+GltG6dZEgAAAAAAAGRa\nmluMJkmy64k/u7B8+IPDrlm8tmCXzof+9+XnFKRbEAAAAAAAAGRaygFhUlB0+BmXH35GylUA\nAAAAAABAEKluMQoAAAAAAADkl4AQAAAAAAAAAhEQAgAAAAAAQCACQgAAAAAAAAhEQAgAAAAA\nAACBCAgBAAAAAAAgEAEhAAAAAAAABCIgBAAAAAAAgEAEhAA1mXuEAAAgAElEQVQAAAAAABCI\ngBAAAAAAAAACERACAAAAAABAIAJCAAAAAAAACERACAAAAAAAAIEICAEAAAAAACAQASEAAAAA\nAAAEIiAEAAAAAACAQASEAAAAAAAAEIiAEAAAAAAAAAIREAIAAAAAAEAgAkIAAAAAAAAIREAI\nAAAAAAAAgQgIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAIBABIQAAAAAAAAQiIAQAAAAAAAA\nAhEQAgAAAAAAQCACQgAAAAAAAAhEQAgAAAAAAACBCAgBAAAAAAAgEAEhAAAAAAAABCIgBAAA\nAAAAgEAEhAAAAAAAABCIgBAAAAAAAAACERACAAAAAABAIAJCAAAAAAAACERACAAAAAAAAIEI\nCAEAAAAAACAQASEAAAAAAAAEIiAEAAAAAACAQASEAAAAAAAAEIiAEAAAAAAAAAIREAIAAAAA\nAEAgAkIAAAAAAAAIREAIAAAAAAAAgQgIAQAAAAAAIJCCXC6Xdg1f1sqVK8vLy9Ou4nNTp05d\ntGjRzjvvvM8++6RdS/48/fTT5eXlnTp1at++fdq15El5efnTTz+dJEm3bt223nrrtMvJk08+\n+WTKlClJkvTp06dBgwZpl5Mnc+bMmTlzZr169fr165d2Lfnz5z//+f333y8tLe3Ro0fateTP\npEmTlixZ0r59+06dOqVdS/488cQTVVVVnTt3bteuXdq15MmaNWueffbZJEl69uzZsmXLtMvJ\nk4ULF7700ktJkvTr169evXppl5Mn77333l/+8pcGDRr06dMn7Vry54033vjnP/+5zTbbHHLI\nIWnXkj8TJkxYtmzZrrvuutdee6VdS/489thj1dXV++6774477ph2LXmyevXq5557LkmSQw89\ntEWLFmmXkycLFix4+eWXk2AD+OzZs2fNmtWoUaMjjjgi7VryZ8aMGR999FGbNm26du2adi35\n88ILL6xYsaJjx4577LFH2rXkSS6Xe/TRR5MkOeCAA7bbbru0y8mTFStWvPDCC0mSHHbYYc2a\nNUu7nDyZO3fuq6++miRJ//79Cwuj3Iwxa9as2bNnN23atHfv3mnXkj+vvPLK/Pnzt9tuuwMO\nOCDtWvLnueeeW7169R577NGxY8e0a8mTdevWPf7440mSdO3atU2bNmmXkyfLli2bMGFCkiTf\n+ta3mjRpknY5/6JVq1Zpl5BZxWkX8BU0bdq0adOmaVfxuaeffnrGjBn9+/f/1re+lXYt+TN2\n7NilS5cOHjz4wAMPTLuWPFmyZMmoUaOSJNlzzz3jXMnMmTOnptX9+/ePMwQ/99xzo0aNatas\n2RlnnJF2LfnzyiuvPPzww126dBkwYEDateTPE088MXPmzOOPP/6www5Lu5b8GTNmTFlZ2RVX\n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\n5QXcIiPm/OQzm3xGcla/1P94fvRldz592Pm3XNx3t7L5r995420vf1DQ73tDzv72fllt8mdi\n9XX//v03/4ZMTsUDjmb9+/cvKCja8RsHHLRvhwaFG/ksDxw4MP9V1bWAHV1bxcr3f3fXr8ZP\nmt3+oCM6tf78LuHvfve7KVZVR2L3dazT1kZZQsmeq6++evNv+PnPf56fSvIqZF8vnHbzube8\nft5No47qsFXt48v/9sz5V4w84Mq7L+u6TVq11Z2YE7MaoeYn1CYg/GruvffejR4vm/fms6/M\nKShq8ujDD+a5pHyqXDn/pUkTJkyY+Nq783O53C779jri8MO/efBeGx0xsyrDu4LEPPdTW7bv\nKvMJ/4KyBWMGnf/Uo4+MT7uQuhJqi4yY85OYz0iu8c8X7h5yx5MH9u/11hMvFrbr9oMrLu7c\numHaRdWhmH3dv3//4355/0lbb7JnGzTI4B3/AUezs88+e/NvuOeee/JTST4F7OhP5Spefvz+\nu8Y+taJRuzMuuvToA3dKu6A6F7OvY562NsUSChkQs68fOPukqXv9cOTgLhv+6c0RF97w54PH\n3XNa/quqazEnZgHnJ9RWnHYBXzMbZua53NpJD901csY/tt7zsMGXnpdKVXlTr2mbnv0G9ew3\naOWCdye9OGHCxIkjb5pwT9O2f/jNqLRLq3Mb7gqSdkVb3nNjXm976A+/MN1JkqT5bn2u7P3Y\nDXc/m3TN4Ll/7Nixm3/D6aefnp9K/hMUFpeeevEe597wxyTJYEAY8xO+GWXzPigq2SHtKupQ\no+06X/zfI/u+9NiwYfeeN/GJbG+REXN+ctbgHxeVtOp6aN+BtZ6RPHpE2mXlxU6HnTO8sHDI\n7Y8173LWqP86JvNb6Ybt6+L69TOZAm5GwNEsm8tM/07Ajk6SZNFfJ4z81d2vfVi231FnfP+s\n/qX1QjyEL2Zfhz1t1WYJJdoFZoaT4CRqX7+wtHzvgRv/5rY/do+1L/wpSTLY6oATs5jzE2oT\nEP5/Wfbe1Dtv/+UbCxsde951p/fZJ+uLM59r2rpDv0Ed+g06d8G7r02YMCHtcurUJncFSbuw\nLS/muX/8+PEFBUVt27VruIkzYKiAMEmSRm12XFfxVNpV1ImYn/BNqa5c9MCIWVvtflHahdSt\nipXvvzRtytyK6vYH7V97i4zMCzI/aVFStKxyyYcfzW23YOHSVe0bNquXdkV5tWOv7w0vKhxy\n+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\nbCYh+3rt4leuGnzLe8srkiQprFd64g9uOOrgjd8LHkRWJ2Yx5yfUJiCEL6tp6w79BnXoN+jc\nml1B0i6njny20tpjx5qV1ueffaLmD1ldaZ3z5tTJU6ZMmTp9Sa7lAd26fe+qk7p22qU4mxPa\nzwW/ZG3UaseDeuyYJEnFsn9MmzHxH4233Wu/fVqVZHPZ9e9rqvoc0a7mn5u1G5Ak4/c+skO6\nJeXBBltkHHHs3iWjRzx8zeCz0i4t3zK8q2qSBI3K5j53/bjXVpzzs1FHb9ek5sheA045dZtG\ni9/+3yHXPrDyouPSLa+OvH33FaOf+mDXfQ7asVHVM6OvXFxd+2bokv36xNqeLqaMj2YbU125\n6IERs7ba/aK0C8mrbHf0fePur7nt5vd33/bgXZ/edpN2UdSJhx56aKPH15V9/PDwq357w4PH\n3ntBnktKhSWUTC6hrBcqCV4v1GLC09f94oPqjkN/fubOjSqeue+W3936oyN+N6Y08+tlm5Dh\niZn5CQLCr2bo0KEbHiwsbrzjLrsdevTAvbZtkP+SqCN3PPXupUdtfBl92/btip/J2h3lSRJ0\npXXwNTcVFBTt+I0Djtu3Q4PCggXv/fnR9/5c+w0DBw5Mq7a6E/OSNbdu5eP3/OLpV2aVl2z7\nrVMuHtDxHxdcMHxpVZLLVZc0a3/RTdf32i6Dv/6LeQPKWYN/XFTSquuhfQfW2iJj9Ii0y8qj\nDXdVTbuiOhEzKnv8wbe3O/wnR3dq+4XjpXsecVXfx2+8+eWDrz80lcLqVOyboUOLMJpdf/31\nGx7MVVfN/9tbc8taXXN51/yXlH8ROjqJetuNJZTaihpt8+3zjv6f7/0mSTJ4tWUJJcgSyoYi\nJMExFxMe+WjVXj8e0mPvVkmSnPHDix8/+boJy9YObNUw7brqVsCJWcz5CbUJCL+aNm3abHgw\nV1U2a/Ijf3pm4tW/HrF/82xuzffcdVfOqFe4qZfDhw9Po6i69eLooQUFt1zS94sT3KXvvHjT\nTSNnr2x+/CWp1FWHYq60brPNNkmSrFk058Vn52z0DZkMCDcl25esr/3iil9PXPbNfv22Lljy\n5PCh/ywt3KrP939xeu96a+fe/5MrR1/3UK+7zky7RraMwFtkBNpVNYkalU1eXrHf0Z93aJs2\nbZoWfTol26HvXssv/X2SZLDVMW+GTkLOwD8TaDSrqKjY8GBhccMuR5x4cZ+jO2b06vIzgTq6\n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\nDj39dbziOwAAuJPduHW+VE6Gaf95JWBwf4fr70pCQ0M1iAUbooOwdtam53SaEj89sK0Qwr99\ndmj84cTxg1yMimjUduzMPtsjdgoxQeuMda/YtYWnqxC/HN6163CVB+iyQCjhvHySN01KdaeM\nnE0J1dX/bkysauM8NibVK1xCnp6elXeqxflH0rZ8udP8+qqE3rq7qUXIujK0wb6pb/8g3/5B\nU6+PL69fnS2EiJwfo+Px5ZKSEglvaZSzW1TCSXTlPJXJedm6QaoV3wEAwJ3MYrHctN3E06uJ\nOJ5pqeZw6BAFwto5ec06zLdsXPWubp2FONz6+nyb9s6eakm+dtHqUVJSktYRtCHbvHwxYUNn\nJkQJUXXTZPSsydrGqycV7pS5v7l13fywU3q/U0bC0bfKJJlYVc5XuIR9CdVNwGgtPh8/5eXl\nS/aufusRG0fShDwrQwvGlyUg52yEcpZFK5DhVCbtZUstybMcsuQWiHadu7VxNcqw4jsAALiT\n6XsyLdwOCoS1o6qq0/XPaAZFhyOMVbJarQal6tvRSwqz/3PwdO/evW2dyVakWqNVwqZJIeud\nMnKPvkm0rJGQ9RUueV9CeYq92zPhnacs+kwIHY60yrkytJB1fPnnvV+ZXKr9n+vv72/DLDYi\nZ7eohGVRaU9lVdL3Zavg/N4506OPXSoUQigObk/PWhTiV7aEh75XfAcAAMAdizUIayc4OPip\nlRueaekshLh6buPTE9ffWA+jwqaelP+rr1384rW3dsTExJQ+pOO/uryTaWsil/577LwEGebl\n+3n3B5Fx2/oElzVNzpqt56ZJacm5hJWEyxqhgtK+hINtwvTal1Cl/JzVIS9t/+eWTVoHqXty\nrgx9i/FlHQsODr71AZKcyW90i1rO5DnovVtUnkXa5DyV3YKOL1ubpz3z0fn2Ea9OuMe5cOfa\n6G3/Naz6eLWbvd5e0gAAAGhA6CCstYz1K/OcHIQQxVePiXKzt5Vu6p61+MKxY1L8pXLOyyck\na5qUlpxNCUysCn33JVQn/0yWnbGt1inqhZwrQ+9YsCzL2inqL2Xjyx+/+9oQOcaXR763bkwL\n6e5YkrNbtJQ8k+jKeSq7BR1ftracutzljchHuroLIca/Ev752AWmiwWj3KU7swEAAODOQYGw\ndry9vdWs45Zym+Vnb/P29tYkFeqDnPPylWrnPynWTolcumHrwYdlaJqUmTyjb0L2iVVRxtmz\n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"
     },
     "metadata": {
      "image/png": {
       "height": 720,
       "width": 1200
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "options(repr.plot.width = 20, repr.plot.height = 12)\n",
    "\n",
    "ggplot(data1,aes(y= TPT,x=reorder(Daerah, Tahun),fill=factor(Tahun)))+\n",
    "  geom_bar(position = 'dodge',stat='identity')+\n",
    "  labs(x='Kabupateb/Kota',y='TPT',fill='Tahun')+\n",
    "  theme(axis.text.x = element_text(angle=90, vjust=0.5, hjust = 1))\n",
    "\n",
    "ggsave(\"output/eda_hist.png\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f66996ef",
   "metadata": {
    "papermill": {
     "duration": 0.013955,
     "end_time": "2023-05-14T08:05:03.445079",
     "exception": false,
     "start_time": "2023-05-14T08:05:03.431124",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Daerah x TPT"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "cbd668c7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:03.474122Z",
     "iopub.status.busy": "2023-05-14T08:05:03.472981Z",
     "iopub.status.idle": "2023-05-14T08:05:03.482282Z",
     "shell.execute_reply": "2023-05-14T08:05:03.481137Z"
    },
    "papermill": {
     "duration": 0.026091,
     "end_time": "2023-05-14T08:05:03.484402",
     "exception": false,
     "start_time": "2023-05-14T08:05:03.458311",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# install.packages(\"gplots\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "fc8faf84",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:03.514093Z",
     "iopub.status.busy": "2023-05-14T08:05:03.512864Z",
     "iopub.status.idle": "2023-05-14T08:05:04.385680Z",
     "shell.execute_reply": "2023-05-14T08:05:04.384518Z"
    },
    "papermill": {
     "duration": 0.890486,
     "end_time": "2023-05-14T08:05:04.388643",
     "exception": false,
     "start_time": "2023-05-14T08:05:03.498157",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘gplots’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:stats’:\n",
      "\n",
      "    lowess\n",
      "\n",
      "\n",
      "\u001b[1m\u001b[22mSaving 12.5 x 6.67 in image\n"
     ]
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAACWAAAAWgCAIAAABVZ+/5AAAABmJLR0QA/wD/AP+gvaeTAAAg\nAElEQVR4nOzdeXRV5b344Tc5AUFGDTKJBKECKsp1qKJVFEWRKopDKKKtA4jzBF6H218rtl6H\na6vFUhRuqeAAYkRBUECjRQRttdbhIhUVFBxQEZHBAJLk/P44GigiHAgnJ+F9nuVi7ez9nnd/\nwx8ssz7Z5+Qkk8kAAAAAAAAAxCE32wMAAAAAAAAAVUcgBAAAAAAAgIgIhAAAAAAAABARgRAA\nAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhACAAAAAAAABERCAEAAAAAACAiAiEAAAAAAABE\nRCAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAAACIiEAIAAAAAAEBEBEIAAAAAAACIiEAIAAAA\nAAAAEREIAQAAAAAAICICIQAAAAAAAEREIAQAAAAAAICICIQAAAAAAAAQEYEQAAAAAAAAIiIQ\nAgAAAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAAREQgBAAAAAAA\ngIgIhAAAAAAAABARgRAAAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhACAAAAAAAABERCAEA\nAAAAACAiAiEAAAAAAABERCAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAAACIiEAIAAAAAAEBE\nBEIAAAAAAACIiEAIAAAAAAAAEREIAQAAtr+1y/+asym1dqrTdPe23Xv//PbRz6xNZnvKtH32\n95MqvoUP1pZt1WvL1i46uOFOFS8/56kPN1pwbaf8iqvH3PHaJjeZuO9um/z7/L6Wh00NIaxZ\n9tQmr+bm5tZvlN/h4G6X/WbkwjVl27w/AABAjSYQAgAAVJ3Sb9Yu+eT9Zyc9eP15x7fcv88b\nK77J9kQZl9ip9WMPnl3xZdHPLywpX59GF8+44o63vkwd12/Vd8rg/8joMMlk8usVX77z6ow/\n3Xjhvm27zfxybUZvBwAAUD0JhAAAANnx5Zyiow68aE15tufIvNYnj7rhP5qkjld/ObXvQ/NT\nx8nykgv7jEod5+Tk3frMPTvn5lTZVF8vfuG0o26qstsBAABUHwIhAABAZrXr++QX31n43luP\njrhpn4a1U5eWz7/v5Hv/ld3xqsb/mzqifuLbn0CnX3rW0tLyEMI7fzlj8pKS1Mm9zhl/WcfG\nP/TyE19854sNvP/aoIpLP/nff2x46a1p3Td67d4XPl1x9ZOF70wedVPLnRKpS0vn3Dp2yepK\n7g8AAFDj5GV7AAAAgB1cXp1G+fn5qeP8/PzW7X59wk8P3LNt7yXrykIIL/y/q0ovnp5XdQ/O\nZcfOzU+bfHXnbr97LYTwzcqXTx8299mL6592ZXHqau36B06755TNvLxWo13yN/xyVd2K47wG\njSv+ejcpUXf933/Izz/p/F8Xf/PMPhfPSp0Y/Y8l/Xq2rsz+AAAANY4nCAEAAKpavVYnjT9n\nr9TxmmVP//GTVRWXkuUljw//Ta+jD9m9SeOd8mrt3KDxj/Y79BdX3vT3j77+/j5L3njyqnN7\ndyhoUW+nOs0LOnQ9od//Tn6lbIMFbw3tkpOTk5OTk6i1awjhsxfHnnHE/rvWrb1wbdk23K7C\n25OH9j5i3yYN6+zSsl3XE84aPWNhOt9111umdW28U+r4xV+eMfaak+aWrEt9ee64x/esk0hn\nk+1ij16nVxwvn7uiyu4LAABQTXiCEAAAIAsOvKF3+PNtqePHnvnk6nPbhxDK13068LD9R726\nZP26Vcvnz3l5/pyXx44Yec8/51ywzy4VV/5617k9Bt+/LplMfVmy6J3PFr3zwvRxNx9zyeyp\nd7eqvXFvW/raH/c+6qplpeUhhNRrtup2Fd4YcfapV41Ppu67csELixfMevqROY+997veBZv/\nlnNrNR034aLdjx0aQlhXMu8Xw7493+yw34w4qfXmX7ud5ax/YLNWw1pVemsAAIBqwBOEAAAA\nWbBzsz4Vx4unLk4dvHxDz4pcV2e3PQ/68cF7t9st9WXZ2k+uOfG3FS/5+Jnrj/2uDu7Sscvp\nZ/btfvjeqUuLnht+6PG3fO+GZZeceEOqDlZI/3YbKrxqfDKZzKtbv+JMMlk67Jwzyze5+t+1\nPOYPtxzefMMziVpNHpjyn2m8dHv6+MnHKo73PHjXKr47AABA1gmEAAAAWZBXZ6+K41XzV6YO\nbhj1dupgz8IRyz9b8I+XX5n73uez/+fHqZMrFw5b++3jgmWX9ftj6hm+dn1HfDb3pUfHjntm\n9tw3x1+cuvzJ87++/v+Wbni78tIVRZ+uPvzU/v99x113/e7Wxoncrbndv0/e5Jiivy9YU7Jy\n1adv9j+oSerk2hUvPf7F6nS+8asnj9klb/2PogffNO24Xeuk88JtVrZ21fLvfLF44dMP3tr9\n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\nhAAAAAAAABARgRAAAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhACAAAAAAAABERCAEAAAAA\nACAiAiEAAAAAAABERCAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAAACIiEAIAAAAAAEBEBEIA\nAAAAAACIiEAIAAAAAAAAEREIAQAAAAAAICICIQAAAAAAAEREIAQAAAAAAICICIQAAAAAAAAQ\nEYEQAAAAAAAAIiIQAgAAAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAREQgBAAAAAAAgIgIhAAAA\nAAAAREQgBAAAAAAAgIgIhAAAAAAAABARgRAAAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhA\nCAAAAAAAABERCAEAAAAAACAiAiEAAAAAAABERCAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAA\nACIiEAIAAAAAAEBEBEIAAAAAAACIiEAIAAAAAAAAEREIAQAAAAAAICICIQAAAAAAAEREIAQA\nAAAAAICI5GV7AIDqaNGi8M47aa0sLw+vvRYOOCDkpv0bFx07hlattnk0AAAAAACoFIEQYBP6\n9g0vvZSpzbt1C889l6nNAQAAAABg8wRCgE3405/CK6+ktfLVV8PIkWHgwHDQQelu3qXLNs8F\nAAAAAACVJRACbMIBB4QDDkhrZVFRGDkydO8eCgszPBMAAAAAAGwPaX9kFgAAAAAAAFDzCYQA\nAAAAAAAQEYEQAAAAAAAAIiIQAgAAAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAREQgBAAAAAAAg\nIgIhAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAABCRvGwPAAAAAABADbB2bSgpSWtlWVmYOTN0\n7RoSiXQ3b9w45ORs82gAbB2BEAAAAACALWvXLnz8caY2v/76cOutmdocgI0IhAAAAAAAbNng\nweHtt9NauWBBKC4O3buHtm3TWl+7djj55MqMBsDWEQgBAAAAANiyq69Od2VRUSguDgMHhsLC\nTA4EwLbKzfYAAAAAAAAAQNURCAEAAAAAACAiAiEAAAAAAABERCAEAAAAAACAiAiEAAAAAAAA\nEBGBEAAAAAAAACIiEAIAAAAAAEBEBEIAAAAAAACIiEAIAAAAAAAAEREIAQAAAAAAICICIQAA\nAAAAAEREIAQAAAAAAICICIQAAAAAAAAQEYEQAAAAAAAAIiIQAgAAAAAAQEQEQgAAAAAAAIiI\nQAgAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAABARgRAAAAAA\nAAAiIhACAAAAAABARARCAAAAAAAAiIhACAAAAAAAABERCAEAAAAAACAiAiEAAAAAAABERCAE\nAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAAACIiEAIAAAAAAEBEBEIAAAAAAACIiEAIAAAAAAAA\nEREIAQAAAAAAICICIQAAAAAAAEREIAQAAAAAAICICIQAAAAAAAAQEYEQAAAAAAAAIiIQAgAA\nAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAAREQgBAAAAAAAgIgI\nhAAAAAAAABARgRAAAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhACAAAAAAAABERCAEAAAAA\nACAiAiEAAAAAAABERCAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAAACIiEAIAAAAAAEBEBEIA\nAAAAAACIiEAIAAAAAAAAEREIAQAAAAAAICICIQAAAAAAAEREIAQAAAAAAICICIQAAAAAAAAQ\nEYEQAAAAAAAAIiIQAgAAAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAREQgBAAAAAAAgIgIhAAAA\nAAAAREQgBAAAAAAAgIgIhAAAAAAAABARgRAAAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhA\nCAAAAAAAABERCAEAAAAAACAiAiEAAAAAAABERCAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAA\nACIiEAIAAAAAAEBEBEIAAAAAAACISF62BwAAAAAAqMGSyfDww2HlyrQWl5eHt98OHTuG3PSe\n3UgkQmFhaNiwMgMCwMYEQgAAAACAbffuu6Ffvwzun5cXzjkng/sDEKGaFAhLPr//Jz3uGj3r\n5c71am14vnzdkhFDfnXfo9PmffhJae1G+xx49MDrbr2gx4+yNScAAAAAEI/27cMrr4Svvkpr\n8cyZ4be/Db/6VejaNa31eXnhiCMqMx0AbEJNCoTP//rW119/u6Q8ueHJ8tIvzv+PDmPmLmtQ\n8OOTzzy+5KO5TxVPuHDG4y+OfP2+AZ2yNSoAAAAAEI+DD0535bJlIYSw336he/fMjQMAW5De\nG11n29efz3/4rstOHjnv+5fm/K7XmLnLWve69ZP5f39w1MjHps9a9PeHWtYOD1zafW5JadWP\nCgAAAAAAANVZDQiE3Qry6zf70ZmD/lSaTH7/6v1/eisnJzHuwUH1EzmpM00PPnP8gA5l33z2\ny1eXVO2kAAAAAAAAUN3VgLcYPWfwr05aVxZCePn2Xz+ypGSjq3/9am3tBocc3rD2hid37948\n/GnuknkrwpEtqm5QAAAAAAAAqPZqQCA894qrUgf3jbzl+4FwzOxXknm7bHTyjfvfDyG0/3F+\nFYwHAAAAAAAANUgNCISb12n//Tc68+nsu85+YuFODQ+/c98tB8KysrKnnnpqzZo1m1nz2muv\nhRDWrVtXmTkBAAAAAACgOqjxgXBDybLlD9026OIbR6/Ozb/r2UmN83K2+JK//vWvJ598cjqb\njx079uijj67siAAAAAAAAJBVO04gfGf6vRdcdO3MD1bu0rHHX8aPLdx/13Re1a1btyeeeGLz\nTxAOHz58xowZrVq12k6TAgAAAAAAQNbsCIGwvPTL3194yrV/mVWrftvBQ+//7WWn1M3d8rOD\nKYlEolevXptf89RTT4UQcnNzKzsoAAAAAAAAZFuND4TJ8q8HH9PpDy8s3v+M/yq6b0j7+rWy\nPREAAAAAAABUXzU+EL5+W48/vLD4gCvG/nPomdmeBQAAAAAAAKq7mv62mWUDb3ulVr19n/t9\n32xPAgAAAAAAADVAzX6CcM2XU/+x8pu8OiWnHnfM9692Gf7YrXvvUvVTAQAAAAAAQLVVswPh\n2q+eCyGUrnl/xoz3v3+13opvqnwiAAAAAAAAqNZqUiA8b97S8/79TKO2dyaTd2ZnGgAAAAAA\nAKiBavpnEAIAAAAAAABbQSAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAAACIiEAIAAAAAAEBE\nBEIAAAAAAACIiEAIAAAAAAAAEREIAQAAAAAAICICIQAAAAAAAEREIAQAAAAAAICICIQAAAAA\nAAAQEYEQAAAAAAAAIiIQAgAAAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAREQgBAAAAAAAgIgIh\nAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAABARgRAAAAAAAAAiIhACAAAAAABARARCAAAAAAAA\niIhACAAAAAAAABERCAEAAAAAACAiAiEAAAAAAABEJC/bA8AO4rPPQmFhKClJa3EyGVauDA0a\nhJyctNYnEuGee8KBB1ZmQAAAAAAAgBAEQtheysvDqlVh+fK0FpeUhE8/Dc2bh513Tmt9vXqh\nrKwy0wEAAAAAAHxLIITto0WL8M9/pru4qCj06RPuvjsUFmZyJgAAAAAAgO/xGYQAAAAAAAAQ\nEYEQAAAAAAAAIiIQAgAAAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAREQgBAAAAAAAgIgIhAAAA\nAAAAREQgBAAAAAAAgIgIhAAAAAAAABARgRAAAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhA\nCAAAAAAAABERCAEAAAAAACAiAiEAAAAAAABERCAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAA\nACIiEAIAAAAAAEBEBEIAAAAAAACIiEAIAAAAAAAAEcnL9gAAAETqxRfDmDHpLk4mw8cfh913\nDzk5aa1v1y5ce+02jwYAAACwIxMIAQDIjmnTwsiRmdp8993Df/5nujURAAAAICoCIQAA2fGb\n34Srr0538aRJ4bzzwn33hVNOSWv9zjurgwAAAACbJhACAJA1u+yS7sp69b79M/2XAAAAALBJ\nudkeAAAAAAAAAKg6AiEAAAAAAABERCAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAAACIiEAIA\nAAAAAEBEBEIAAAAAAACISF62BwAAgB3cokWhtDStlWVl4cUXw+GHh0QirfX16oVmzSozGgAA\nABAjgRAAADLokUfCz36Wqc0TiTBvXmjXLlP7AwAAADskgRAAADLoyCPDL3+Z7hOEb78dJk0K\np5wSOnZMa33DhmGPPSozHQAAABAjgRAAADKoRYtw883pLi4qCpMmhbPOCoWFmZwJAAAAiFtu\ntgcAAAAAAAAAqo5ACAAAAAAAABHxFqMAsINYvTqsWZPWyrKyMHNm6No1JBJpra9TJ9StW5nR\nAAAAAIBqRCAEgB3BggVh333TDYRbKzc3TJ4cfvrTjGwOAAAAAFQxgRAAdgTNmoWLLgolJWkt\nXrAgFBeH7t1D27ZprU8kwr77VmY6AAAAAKAaEQgBYEdQr1646650FxcVheLiMHBgKCzM5EwA\nAAAAQLWUm+0BAAAAAAAAgKojEAIAAAAAAEBEvMUosHUmTgzz5qW1srw8zJ8f2rULuen9KkJe\nXjjjjFBQUJnpAAAAAACALRAIga1QVhb69QurV2dq/88/D7ffnqnNM6Ru3fV/AgAAAABA9ScQ\nAlshkQhz54alS9NaXFwcrr8+3HZb6N493f333nubR8uanj3D9Onh2GOzPQcAAAAAAKRHIAS2\nTps2oU2btFYuWBBCCG3bhoMOyuRA2ZZIhOOPz/YQAAAAAACQNoEQAAAAAADYMa1YEcrK0lpZ\nVhZmzgxdu4ZEIq31tWuHevUqMxpkk0AIAAAAAADsgJ58MvTqFZLJjGxeq1aYMye0b5+RzSHT\nBEIAAAAAAGAH1LlzuOSSsG5dWosXLAjFxaF799C2bVrrGzQIrVpVZjrIJoEQAAAAAADYAbVq\nFYYNS3dxUVEoLg4DB4bCwkzOBNVDbrYHAAAAAAAAAKqOQAgAAAAAAAAREQgBAAAAAAAgIgIh\nAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAABARgRAAAAAAAAAikpftAQAAAABgvVGjwvTp6S5O\nJsPnn4emTUNOTlrrjzsuXHDBNo8GALCDEAgBAAAAqEaefjoUFWVq87IygRAAwFuMAgAAAFCd\njB8fksl0/3vkkRBCeOSRdNdPmJDtbw8AoBoQCAEAAAAAACAiAiEAAAAAAABERCAEAAAAAACA\niAiEAAAAAAAAEBGBEAAAAAAAACIiEAIAAAAAAEBEBEIAAAAAAACIiEAIAAAAAAAAEREIAQAA\nAAAAICJ52R4AoGabO3fuvHnzcnJyOnbs2LFjx2yPAwAAAAAAWyAQAmyjp59+evDgwXPmzKk4\n07lz57vuuqtbt25ZnAoAAAAAADZPIATYFqNHjz7//PMbNGhwxRVXHHrooSGE2bNn33///d27\nd3/ooYf69u2b7QEBAAAAAGDTBEKArbZw4cKLL754zz33fO655woKClIn+/XrN2jQoGOOOeaC\nCy7o2rVry5YtszskAAAAAABsUm62BwCoeUaOHLlmzZqRI0dW1MGUdu3aDR8+fNWqVaNGjcrW\nbAAAAAAAsHkCIcBWmzVrVn5+/jHHHJP68q233po3b17q+IQTTqhfv/7s2bOzNx0AAAAAAGyO\nQAiw1ZYtW9a0adOcnJwQwuOPP37wwQdXfOhgIpHYbbfdvvzyy6wOCAAAAAAAP0ggBNhq+fn5\nn376aXl5+YgRIwoLC9esWTN//vzUpXXr1n3++edNmjTJ7oQAAAAAAPBDBEKArXbUUUctW7bs\n5z//+UUXXdS2bdsePXqsXLky9dTg5MmTv/76665du2Z7RgAAAKA6qlt3/Z8AkC0CIcBW69+/\nf61atcaOHdupU6dZs2b95Cc/CSEsWrRozpw5l156aaNGjc4///xszwgAAJaJZ2MAACAASURB\nVABURz17hunTQ8+e2Z4DgLjlZXsAgBpm7dq1gwcPXrduXU5OznvvvXfdddelzl999dUvvfRS\neXn5hAkTmjZtmt0hAQAAgOopkQjHH5/tIQCInicIAbbCV199ddxxxxUVFZ199tkzZsw48MAD\nR48ePXr06BDCjBkzDjnkkNmzZ/fq1SvbYwIAAAAAwA8SCAHStXjx4qOPPvqFF1644oorxowZ\n07Vr19mzZ3/44YcPPPBACOGCCy6YOXPmj3/842yPCQAAAAAAmyMQAqTlX//6V5cuXd58883b\nb7996NChubnf/vvZqlWrvn375uXlLV26NLsTAgAAAABAOnwGIcCWvfzyyyeeeOKKFSsefPDB\nfv36bXQ1Ly+vZcuWCxcuzMpsAAAAAACwVTxBCLAFkydP7tat2+rVqydNmvT9OphSUFAgEAIA\nAAAAUCMIhACbM2bMmNNPP71u3brFxcUnnHDCDy0rKCj44osvVq5cWZWzAQAAAADANvAWowA/\n6Pbbb7/hhhvatGkzbdq09u3bb2ZlQUFBCOHDDz/cZ599qmo6AIBMKSsLK1ZsxeKZM0PXriGR\n2PLiRCI0bFiZ0QAAANgOBEKATUgmk9dcc82dd9653377TZ06dffdd9/8+lQgXLhwoUAIAOwA\nTj01TJ6cqc179QpPPJGpzQEAAEiHQAiwsbVr155zzjnjx4/v1q3bxIkTG6bxW+5t2rQJIfgY\nQgBgx9C3b2jRIt3FCxaE4uLQvXto2zat9Ucdtc1zAQAAsH0IhAD/ZtWqVaeddtozzzxz2mmn\nPfTQQ3Xq1EnnVRVPEGZ4OgCAqtCvX+jXL93FRUWhuDgMHBgKCzM5EwAAANtPbrYHAKhGPv30\n065duz7zzDOXX355UVFRmnUwhNC6deucnByBEAAAAACA6k8gBPjW/PnzjzzyyNdff/3GG2+8\n++67c3O34l/IOnXqNG3aVCAEAAAAAKD68xajACGE8Morr5x44onLli0bOXLkgAEDtmGHgoIC\ngRAAAAAAgOrPE4QAobi4+Nhjjy0pKZk0adK21cEQQkFBweLFi9euXbt9ZwMAAAAAgO3LE4RA\n7B544IH+/fs3aNBg8uTJhx9++Dbv06ZNm/Ly8o8++qhdu3bbcTy2i0WLQmlpWivLysKLL4bD\nDw+JRFrr69ULzZpVZjQAAAAAgKomEAJRGzp06KBBg1q3bj1t2rQOHTpUZquCgoIQwsKFCwXC\n6ubhh8OZZ2Zq80QivPNOaNs2U/sDAAAAAGx3AiEQqWQyed11191xxx2dOnWaOnVqq1atKrlh\nRSDcHtOxPR11VPjlL9N9gvDtt8OkSeGUU0LHjmmtb9gw7LFHZaYDAAAAAKhqAiEQo2+++ebc\nc88dN27c0UcfPXHixEaNGlV+T4Gw2mrRItx8c7qLi4rCpEnhrLNCYWEmZwIAAAAAyB6BEIjO\nqlWrCgsLp02b1rt377Fjx9atW3e7bCsQAgAAAABQI+RmewCAKvXZZ58dddRR06ZNu/TSSydM\nmLC96mAIoWHDho0bN/7ggw+214YAAAAAAJAJAiEQkffff//II4987bXXbrzxxmHDhuXmbud/\nA9u0aeMJQgAAAAAAqjmBEIjFq6++2qVLlwULFtx7771DhgzJxC0KCgo++uijsrKyTGwOAAAA\nAADbhUAIROG555475phjli9fPn78+IEDB2boLgUFBevWrVu8eHGG9gcAAAAAgMrLy/YAABk3\nYcKEs846a+eddy4uLj7iiCMyd6OCgoIQwsKFC1u1apW5uwAAAAA11Lp161599dVPPvlk1113\nPeiggxo0aJDtiQCIlCcIgR3c3Xff3adPn/z8/BkzZmS0DoYNAmFG7wIAAADUOKWlpTfffHOz\nZs0OO+yw008/vVu3bk2aNBkwYMCXX36Z7dEAiJEnCIEdVjKZvOmmm2666aZ99tln2rRpe+yx\nR6bvmAqEH3zwQaZvBAAAANQgpaWlp5566pQpUzp06DBo0KAf/ehHixcvnjRp0qhRo2bOnPnC\nCy80a9Ys2zMCEBeBENgxlZaWXnTRRaNGjerSpcuUKVPy8/MzdKOysvDss+HYY0Mi4QlCAAAA\nYBPuvvvuKVOmnHvuuSNHjqxVq1bq5NVXXz18+PDLLrvs0ksvffTRR7M7IQCxEQiBHdDXX39d\nWFg4derUU045Zdy4cXXr1s3cvaZODb16hcmTw0knhd12261evXoCIQAAAKT84x/hkktCeXla\ni5PJsHJlaNAg5OSktb5u3fDoo6H6P3qXTCaHDh1aUFAwYsSIijqYcskllzz77LOPPfbYhx9+\nWAVvfQQAFXwGIbCjWbJkSbdu3aZOnXrhhRdOmDAho3UwhLB69fo/QwgFBQUCIQAAAGyDFSvC\nu++GFSuyPcf2tmjRokWLFvXu3bt27dqpM88///xXX32VOu7Tp08ymZw9e3b2BgQgRp4gBHYo\n77//fo8ePd59990bb7xxyJAhVT9AQUHB888/n0wmc9L8dUcAAADYcR18cHj55XQXFxWFPn3C\nLbeEwsJMzlTlli5dGkJo0aJF6stRo0YNGDCgQYMG/fv3v+qqq1LnU2sAoMoIhMCO4/XXX+/Z\ns+eSJUvuvffeCy+8MCszFBQUlJSULFmypGnTplkZAAAAAKhW8vPzQwiLFy8OIXz44YeDBw/e\nfffdd9tttz/84Q/Dhg075JBDKtZQTYweHZ56Kt3FyWT4/PPQtGlab42bSITjjgvnn1+Z6QC2\nD4EQ2EHMmDGjd+/ea9asGTduXGH2ftWwdevWIYSFCxcKhAAAAEAIoXXr1gUFBRMnTrztttsG\nDhy4YsWKcePG9ezZc9asWbfffvuUKVNCCHfeeWcikTjttNMSiUS25yVMmxaKijK1+erVAiFQ\nLfgMQmBH8Pjjj/fs2TMnJ+fpp5/OYh0MIRQUFIQQfAwhAAAAkJKTk3PllVcuXLiwW7du06ZN\nGzBgQM+ePUMIRxxxxPHHHx9C2GuvvebMmdOnT5+OHTsOHTq0pKQk2yNvB3Xrrv+zxnn44ZBM\npvvfI4+EEMIjj6S7fuLEbH97ACEEgRDInCr7H8Fhw4adccYZu+yyy4wZM7p27Zrx+22WQAgA\nAABs5PLLLz/uuOP+9re/5eXl7bbbbuPGjbvzzju7du16xRVXtG/ffvbs2e+///6NN964bNmy\nq666qk2bNkOGDPniiy+yPXWl9OwZpk8PPXtmew4AfoBACGRKFfyPYDKZHDJkyOWXX96hQ4e/\n/e1vnTt3zuDN0tOmTZsgEAIAAAAbSCQSOTk5Of+fvfsOa/L62wB+wgYZigMEJSgIyutAsA5c\nZSoynOBiqFVwFXBQqAtwVFCUYR1gFQEXUKWCioqCIE7AjcqQLWAVy95J3j/Sn7VWW0fISeD+\n/MF1JXmS3PbqRcJzP+d7GAwZGZmffvpp3rx5a9asuXPnzpIlS27fvt2zZ08lJSVvb+/CwsKQ\nkBBFRUUfH58+ffo4ODg8ffqUdvYvJCpKzMwIBqYCAAgsFIQA0F7a+4sgi8Vydnb28fEZOXJk\namoqd/M/6nr37i0hIYGCEACA54R6QhEAAAAAdHIhISGXLl1ycnKqrKy8devW6dOnr169+vr1\n69DQ0K5du749TFZW1snJ6cmTJ3Fxcfr6+pGRkYMHD7aysrp8+TLF8AAA0CGhIAQAodTQ0DB1\n6tSDBw9aWlomJyf36NGDdqI/iYiI9OnTBwUhAADPYUIRAAAAAAipoqKiH374gclk7ty5U0xM\nbNSoUdOnT584caKsrOwHjxcREbGysrp+/XpGRsb8+fMTEhJMTU319fUjIiLa2tr4HB4AADoq\nFIQAIHzevHljZmZ27tw5BweH06dPy8jI0E70N0wmEwUhAADPYUIRAAAAAAgjDofj5ORUV1cX\nEhIiJyf3Wc/lloLZ2dkuLi7Pnj1zdHTU0tIKCgqqr69vp7QAANB5oCAEACFTVFQ0duzY69ev\nu7i4HDlyRFxcnHai9zGZzKqqqurqatpBAAAAAAAAAICy/fv3X7p0ydnZedKkSV/2ChoaGkFB\nQYWFhb6+vs3NzW5ubioqKq6urqWlpbyNCgAAnQoKQgAQJllZWePHj8/Ozvb39w8KCmIwGLQT\nfQCTySSEYBEhAAAAAAAAQCdXWFjo6emprq6+Y8eOr3ypnj17enh45Ofnh4eH9+nTJzg4WEND\nw8HB4fHjxzyJCgAAnQ0KQgAQGrdu3Zo4ceLLly9PnDixZs0a2nE+CgUhAAAAAAAAAHzNcNGP\nkZSUdHBwePToUWJiopmZWWRk5JAhQ8aNGxcfH8/hcHjyFgAA0EmgIAQA4XDmzBkjI6Pm5ub4\n+PjZs2fTjvNv1NXVCQpCAAAAAAAAgM5t3759iYmJy5YtMzMz4+0ri4iImJiYxMfH3717197e\n/vbt29bW1sOHD4+IiGhtbeXtewEAQEeFghAAhMDhw4dnzZqloKCQmprK82/VPIcVhAAAAAAA\nAACdXEFBwY8//qiuru7r69t+78ItBXNzcz08PAoLCx0dHdXU1Ly9vf/444/2e1MAAOgYUBAC\ngKDz8/P77rvv1NTUrl27Nnz4cNpx/lvfvn1FRUVREAIAAAAAAAB0Tmw2e+HChXV1daGhobwa\nLvovuDVkcXFxYGCgmJiYj48Pk8l0dXUtLi5u77cGAADhhYIQAAQXi8VaunSpp6fnN998c/Pm\nTU1NTdqJPom4uLiysjIKQgAAAAAAAIDOae/evSkpKStWrDA1NeXbm8rLy7u6uj5//jw8PFxd\nXT04OLhfv35WVla3b9/mWwYAABAiKAgBQEA1NzfPmTMnJCTExMTkypUrvXr1op3oMzCZzMLC\nQtopAAAAAAAAAIDfCgoK1q1b169fv+3bt/P/3SUkJBwcHB4+fHjt2rUpU6acO3du9OjR48aN\ni4+P53A4/M8DAAACCwUhAAiiP/74w9TU9Ndff7Wzszt//jwfxnHwlrq6+qtXrxoaGmgHAQAA\nAAAAAAD+4Q4XbWhoCAsLk5WVpZiEWwrev3/fyckpMzPT2tpaW1s7KCiosbGRYioAABAcKAgB\nQOCUlZUZGhpeu3bNxcUlPDxcXFycdqLPxmQyORxOSUkJ7SAAAAAAAAAAwD979uxJSUlZuXLl\nxIkTaWchhJChQ4eGhIQUFBR4eXlVVla6ubmpq6t7e3tXVlbSjgYAAJShIAQAwfL06dMxY8Y8\nfPhwx44dQUFBIiJC+WuKyWQSQrANIQAAAAAAAEDnUVBQsGHDhn79+m3bto12lr9RVlb29vYu\nKioKDAyUlpb28fFhMpnOzs7Z2dm0owEAADVCeeYdADqq27dvT5gwoaKi4tixY+7u7rTjfDkU\nhAAAAAAAAACdCpvNXrBggSAMF/0YWVlZV1fX/Pz8uLi4IUOGhIaG6ujoWFlZ3bhxg3Y0AACg\nAAUhAAiK+Ph4IyOjpqamM2fOzJ07l3acr4KCEAAAAAAAAKBTCQoKSk1NdXFxEZDhoh8jIiJi\nZWV18+bNa9euzZw5MyEhYezYsSNGjIiIiGCxWLTTAQAA/6AgBACBcOTIkRkzZsjJyV29enXy\n5Mm043wtFIQAAAAAAAAAnUd+fv7GjRv79++/ZcsW2lk+1bhx46Kjo589e+bi4vLkyRNHR0ct\nLa2goKCGhgba0QAAgB9QEAIAfX5+fosWLerbt++1a9f09fVpx+EBGRmZHj16FBYW0g4C8GHS\n0n/9BAAAAAAAgK/BHS7a2NgosMNF/4WmpmZQUFBhYaGXl1dNTY2bmxuTyfT09CwrK6MdDQAA\n2hcKQgCgicViLV++3NPTU09P7+bNmwMGDKCdiGfU1dWxghAElrk5uXiRmJvTzgEAAAAAACD8\nAgICrl275urqOmHCBNpZvlCvXr28vb1LS0vDw8N79Ojh5+fXv39/BweHJ0+e0I4GAADtBQUh\nAFDT3Nw8b968/fv3GxkZJSUlKSkp0U7ES0wms6ysrLW1lXYQgA8QFSVmZkRUlHYOAAAAAAAA\nIZednS10w0U/RlJS0sHBISsrKy4ubvz48ZGRkYMHDzY1NY2Pj6cdDQAAeA8FIQDQUVtba2Vl\nFR0dPXPmzHPnzsnLy9NOxGNMJpPFYr148YJ2EAAAAAAAAABoF2w2e/Hixc3NzUeOHOnSpQvt\nOLwhIiJiZWWVmJiYkZFhZ2d39epVa2trPT29iIiItrY22ukAAIBnUBACAAXl5eUTJkxITEx0\ncXGJjo6WkpKinYj3mEwmIQRTRgEAAAAAAAA6qt27d6elpa1atWr8+PG0s/Cevr5+REREdna2\ni4tLTk6Oo6PjgAED/Pz8qqqqaEcDAAAeQEEIAPz2/Pnz8ePHP3jwwMvLKygoSESkY/4i4haE\nhYWFtIMAAAAAAAAAAO9lZ2dv2rRJW1u7AwwX/Rf9+/cPCgp68eJFYGBga2urp6cnk8l0dXUt\nKSmhHQ0AAL5KxzwvDwACKz09fcyYMUVFRQcPHvT29qYdpx1hBSEAAAAAAABAR/V2uOgvv/wi\nLS1NO067U1BQcHV1zc/PDw8P79u3b3BwsKampq2tbXp6+gePb2houHjxYmhoaFhY2L179zgc\nDp8DAwDAfxKjHQAAOiAOh5OQkHD27Nni4mJpaenhw4fb2dmpqaklJibOnDmTzWafOXNmypQp\ntGO2LxSEAAAAAAAAAB2Vv79/Wlqau7v7uHHjaGfhHwkJCQcHB3t7+ytXrgQFBcXExMTExIwd\nO9bDw8PS0pLBYBBC2Gy2v7//9u3b351EOmzYsAMHDowePZpedgAAeB9WEAIAj5WWlo4dO9bC\nwmL//v3JycmxsbHr16/X1NScM2eOhYWFuLj4pUuXOnw7SAjp1q2bgoICCkIAAAAAAACADubZ\ns2fe3t7a2to+Pj5f8HQWi1y6RFgsnufiEwaDYWJiEh8ff+/ePXt7+zt37lhbW+vq6oaGhjY1\nNTk7O3t4eCgpKQUEBFy+fDkuLs7V1TU3N3fixIlXrlyhnR0AAP6CghAAeKm+vt7U1PT27dvc\nuRP19fUNDQ0JCQk9e/aMioqSk5O7ceOGgYEB7Zh8oqamhoIQAODrPXjwYM2aNUZGRgYGBvPm\nzTtx4kRrayvtUAAAAADQSX39cNGEBDJpEklI4Hk0ftPV1Y2IiCgqKvLy8iouLnZ2dlZRUfnl\nl1/MzMzu37/v5uZmbGxsZWUVGBh469YtWVlZR0fHhoYG2qkBAOBPKAgBgJcCAgKePXu2c+fO\nwMDAfv36EULExcWvXLlSVlYmKSnZ2NjYrVs32hn5h8lkFhcXs9ls2kEAAIQVm81evXr18OHD\nd+/eff/+/ZKSkqioqHnz5n3zzTcFBQW00wEAAABAZ7Rjx47r169/zXDRxsa/fnYAvXv39vb2\nLi4uDgwMbGpqIoRcv37dw8Pj3WumhwwZ4u3t/eLFi7i4OHpJAQDgb1AQAgAvHT9+vE+fPq6u\nrtybzc3Nc+fO9ff3NzQ0DAkJaWxsPHPmDN2E/KSurt7S0lJRUUE7CACAsNq4cWNAQMD48ePT\n09PfvHlTUlLy+++/b9y4MSsry9TUtLa2lnZAAAAAAOhcnjx54uPjM2jQIG9vb9pZBIucnJyr\nq6uUlNSgQYM0NTWDg4M1NTXnzp2bm5vLPWDq1KmEkNu3b1ONCQAAf0FBCAA8w2azc3NzR48e\nLSoqSgi5fv26iYlJVFSUra1tQkKCsbExIeTp06e0Y/IPk8kkhGDKKADAlykqKtq5c+eoUaMu\nXbo0YsQI7p3du3ffvHlzYGDg8+fPAwIC6CYEAAAAgE6lra1t4cKFra2tYWFhUlJStOMIHA6H\nU1NTo6Ojc//+/cTERGNj46ioKAMDgwcPHhBCevToQQipqqqiHRMAAP6EghAAeIbFYrHZbDEx\nsdjY2LFjx44bN+7GjRurVq06ceKEpKSkuLg4IaStrY12TP5BQQgA8DVOnz7d2tq6adMmSUnJ\n9x5atmxZnz59YmJiqAQDAAAAgM5p586dd+7cWbt27ahRo2hnEUQMBqNnz54lJSWEEBMTkwsX\nLsTHx9fV1RkbG9+9e5d7ekRJSYl2TAAA+BMKQgDgGRaL1bVr19OnT8+YMePu3btLlix58uTJ\n7t27RURECCHc68W4GxN2EigIAQC+BncY0ciRI7k3jx8/bmlpefXqVUKIiIjIiBEjcnNzORwO\nxYQAAAAA0HlkZWX5+Pjo6Oj4+PjQziK4jIyMMjIysrKyuDctLCzOnDnT0NBgYmKyY8cOQoih\noSHVgAAA8BcUhADAA5WVlVu2bGEymW/evGlpabGxsSksLAwNDdXW1uYewGaz/fz8RERErKys\n6EblJ25BWFhYSDsIAIBQ4pZ/3KtMOByOl5fXuXPnDA0NJ06ceOXKFQaDgXYQAAAAAPijra1t\nwYIFLBbryJEj/5xvAW+tXbuWwWBwzwtx7zEzM4uPj29oaDhy5Ii2trapqSnVgAAA8BcUhAAU\nSEv/9VPY5efnf//990wmc9OmTV26dNmyZYuiomJCQsLFixdZLBb3mLKystmzZyclJS1btkxT\nU5NuYH7q1auXtLQ0VhACAHwZDQ0NQkhmZiYh5NatW3l5efb29osXL75586aJicn58+eVlJQY\nDAbtmAAAAADQ8e3YsSMjI8Pd3f2bb76hnUWgDR8+PDg4ODs7W0dHZ/78+du3b/fy8tq4cWNz\nczODwXjx4sWtW7doZwQAgD+hIASgwNycXLxIzM1p5/g69+7dc3Bw0NbW/vnnnwcMGBAeHp6T\nk7Nhw4bz58/Lyck5OjoqKytPmDBh+PDhTCbz119/nTNnTkBAAO3UfMVgMPr27VtcXEw7CACA\nUJo2bZqoqOjWrVvb2toiIyMJIatXrz548GBeXp6JiUlzc3NJSYmBgUF8fDyWEgIAAABA+3ny\n5MmWLVsGDRq0adMm2lmEwPLlyy9fvqyvr3/ixIl169Zt3rz54cOHS5YsiYuLYzAYZmZmycnJ\ntDMCAAAhKAgBqBAVJWZmRFSUdo4vlZaWZmVlpaenFxkZOWrUqLi4OG5ZKCYmRggZNWrU48eP\nt27dqqGhkZubW11dPXXq1HPnzp04cUJcXJx2dn5jMplYQQgA8GU0NTW///771NRUS0vLkydP\n6ujo6Orq1tfXR0dHX7t2TVVV1dnZ+d69e9bW1np6ejExMagJAQAAAIDn2traHB0d29rawsPD\npaSkaMcRDoaGhteuXXv9+nVmZubjx4/fvHkTGhpqaWl54cIFUVFRS0vLK1eu0M4IAABEjHYA\nABAaLS0tJ0+e3Llz5+PHj8XFxe3t7X/44YfBgwf/80hFRcX169evX7+e/yEFDZPJTExMrKys\n7N69O+0sAADCZ+fOnXV1db/88gv35uDBg/Py8pqbm7W0tH777bdBgwb5+PgEBAQEBwfb2toO\nGzZs/fr1s2bNwtxRAAAAAOCV7du3Z2RkbNiwAcNFP5eioqKiouK79xgYGCQlJZmZmVlbW585\nc8bExIRWNgAAIFhBCACfora2NigoSENDw9HRsaioyMXF5fnz5xERER9sB+FdTCaTEIJFhAAA\nX0ZMTOzgwYMTJ05kMBiqqqocDsfY2PjAgQP3798fNGgQIURJScnX17ewsNDDwyMnJ8fW1lZX\nVxerCQEAAACAJx4+fLh161YdHR1cA80r+vr6iYmJ0tLSlpaWZ8+epR0HAKBTQ0EIAP+moqLC\n29tbTU3Nzc2tra3Ny8urqKgoKCiob9++tKMJB3V1dYKCEADgK/zxxx+3bt0yMjJ69OhRVlbW\nuXPnnJ2dpaWl3z2mV69eb2vCvLw87mrCiIgINptNK/YX4/7L/v7vAwAAAAAK2travvvuOzab\njeGivKWnp3f58mU5ObmZM2fGxcXRjgMA0HmhIASAD3v48KGDg4OampqPj0/fvn1DQkIKCgq8\nvb27detGO5owwQpCAICvFBMT09zcbGdn959Hvq0JuZezODo6cmtCFovFh5y8Ym5OLl4k5ua0\ncwAAAAB0etu2bcvIyFi3bt2IESNoZ+lodHV1L1++rKCgYGNj89tvv9GOAwDQSaEgBID3paWl\nWVlZ6erqRkZGjhw5Mi4u7sGDB05OTrhc7gugIAQA+EqRkZHS0tLTp0//xON79uzp7e39/Plz\nLy+v4uJioasJRUWJmRkRFaWdA+BzYOUrAAB0PA8ePPjpp5+GDh2K4aLtZNiwYSkpKd27d589\ne3ZsbCztOAAAnREKQgD4E5vNjo+PHzVq1Pjx48+fP29hYXHr1i1uWchgMGinE1aqqqri4uIo\nCAEAvkxRUdH169enTZumoKDwWU/s0aPH25qwtLTU0dFx6NChQlQTAggXrHwFAIAO5u1w0cOH\nD0tISNCO02ENGjQoKSmpR48eNjY2x48fpx0HAKDTQUEIAKSuri4oKKhfv37W1tZPnjxxcnJ6\n9uwZtyykHU3oiYqKqqioFBYW0g4CACCUIiIiOBzOp8wX/aB3a8KysjJHR0ctLa3Q0NC2tjbe\n5gTo5LDyFQAAOpgtW7ZkZmauX79eX1+fdpYObuDAgUlJScrKyg4ODkePHqUdBwCgc0FBCNCp\nvXz50tvbm8lkurm5NTU1cTdtCgkJGTBgAO1oHQeTycQKQhActbW1e/funT59+tixYy0sLLZt\n21ZeXk47FMBHHT9+vFevXqampl/zIt27d/f29i4qKvL19X3z5o2zszNqQgAAAAD4mAcPHmzf\nvn3YsGHr1q2jnaVT0NbWTk5O7t2794IFCyIiImjHAQDoRFAQAnRSeXl5rq6u/fr18/HxUVRU\nDAwMLCws9Pb2VlRUpB2to1FXV3/z5k1tbS3tIAAkNTVVS0tr5cqV586dKyoqSkpK2rBhg6am\nJv4GA8F0586dZ8+ezZ07V1xc/OtfTV5e3sPDo7i42NfXt6qqytnZecCAAagJAQAAAOBdbW1t\nixYt4nA4hw4dwnBRvhkwYMC1a9fU1NQWLVoUHh5OOw4AQGeBghCg/zUd+gAAIABJREFU00lL\nS7O1tdXW1g4ODtbT04uOjn727Jmrq6u0tDTtaB0Tk8kkhBQXF9MOAp1dVlaWhYVFY2NjaGho\nVVVVaWlpTU3NmTNnevXqtXDhwri4ONoBAd4XGRlJCLG3t+fha8rJyXl4eHBXE9bU1HBrwqCg\noObmZh6+CwAAAAAIqc2bN9+9e3fjxo0YLspn6urqycnJTCZz4cKF+/fvpx0HAKBTQEEI0Fmw\n2ez4+HgDA4Px48efOnVqypQp169fT0tLs7GxEcWOMe2JWxBiyihQ5+np2djYmJCQsGTJEhkZ\nGUKIuLi4tbX1tWvXunXr5urqymazaWcE+EtbW1tMTMzAgQPb49TM25owMDCwsbHRzc1NW1sb\nNSEAAABAJ3f//n1fX19dXd0ff/yRdpbOiMlkJicn9+/ff8WKFfv27aMdBwCg40NBCNDxNTc3\nR0RE6OjoWFtb3717197ePisri1sW0o7WKaAgFC7clbQdbz1tVVXVhQsXrKysxowZ895Dffr0\nWb58eWFh4Z07d6hkA/igCxcuvHz5krfLB98jKyvr6uqal5cXGBjY3Nzs5uampaUVFBTU1NTU\nfm8KAAAAAIKppaXFwcGBEHLo0CGejLiHL6CmppacnKyhobFy5co9e/bQjgMA0MGhIAToyH7/\n/XcvL68+ffo4Ojq+efPG29u7pKQkIiJi4MCBtKN1ItyCsLCwkHYQ+CTm5uTiRWJuTjsHrxUU\nFLS1tY0aNYoQ8ubNm+DgYHNz8/v373Mf5d6fk5NDMyLA3x09epTBYMyfP7+934hbE+bm5vr6\n+r5dTbhv3z6sJgQAAADoVLZs2fLo0aONGzfq6enRztKp9e3b9+rVqwMGDHB1df35559pxwEA\n6MhQEAJ0TLm5ucuWLVNXV9+8eXPXrl337dtXVFTk5eXVs2dP2tE6HTU1NREREawgFBaiosTM\njHS8sbvc8aHPnz+fO3euioqKq6vrhQsXgoKCuI+KiIi8PQZAEFRXV8fFxU2YMIF7jQUfyMrK\nenh4FBQU7Ny5s6mpacWKFZqamj///DNWEwIAAAB0BpmZmb6+vnp6ep6enrSzAFFVVb169aq2\ntraLi0tgYCDtOAAAHZYwFYQNv0cMHz78QX3rPx5hJ4au/3ZoPzlJqV59dRzWBpW14BQndF43\nb96cOXPmwIEDDxw4MHTo0F9//TU7O3vZsmXSHW9mopCQlJRUUlJCQQgUFRUVxcTEEEJ++eWX\nqKgoAwODo0eP6unp/fbbb9w1Unfv3iWEaGhoUA4K8D+nTp1qbGy0s7Pj8/t26dJl7dq1BQUF\nu3btamtr+/777zU0NIKDgxsbG/mcBAAAAAD4prm5ecGCBSIiIkeOHMFwUQHRu3fvq1ev6ujo\nrFq1yt/fn3YcAICOSZgKwpRN2+/fv9/A5rx3f8zK0WbOP2VUdrOYbaOrVBe5y22I/sIa1vuH\nAXRsbDY7Pj7e1NTUwMAgNjbWyMgoLi7u1q1bM2fO5K4NAoqYTCYKQuC/5ubm+Ph4W1tbTU1N\nPz8/SUlJERGRuLi4pKSk+fPnz5kzp6qq6tKlS69fv967d2/v3r3/uT0hAC2RkZFSUlKzZs2i\n8u4yMjKrV68uLCwMCQlhMBiurq5MJtPPz6+hoYFKHgAAAABoVz4+Po8fP/by8hoyZAjtLPAX\nJSWl5OTkoUOHuru7b9myhXYcAIAOSDhqg/rfn58MWGkdmv3Ph2qL9s/dlyHf3zG3IONkROSl\njOLIpf/35nHE1D1P+J8TgIqWlpaIiIghQ4ZYW1unpqba29s/fvw4MTHRysqKdjT4E5PJrKio\nwJw64JunT596enr27dvX2tr69OnT3377bXR0dGpqqri4+OLFi2NjY9ls9pw5cxgMxt69ew0N\nDcvLy3ft2iUmJkY7OAAhhBQXF6emplpZWXXt2pViDElJSScnp/z8/JCQEElJSU9PT3V1dW9v\n75qaGoqpAAAAAIC37t275+/vP3z4cHd3d9pZ4H09e/a8evXqiBEjNm3a5OPjQzsOAEBHIwQF\noSGzu6yS5tzVe9s4H1gUeMvdn8XhLI7d1Vviz3/L3MCziuIit7dt5G9MAApqamqCgoL69+/v\n6OhYWlrq4uKSn58fERGho6NDOxr8DZPJ5HA4paWltINAB1dTUxMaGjpu3DgdHR0/P7/u3bv7\n+vqWlZUlJiba2NiMHDkyJiamqalpxowZ3bt3nzp1qpiY2MWLF7OzswMDA+fOnUs7PsCfjh07\nxmaz7e3taQchhBAJCQknJ6fnz5+Hh4fLycn5+PhoaGh4e3tXV1fTjgYAAAAAX6u5udnBwUFE\nRCQ8PBzDRQVTt27dEhMTR44c6e3tjR0iAQB4SwgKQsc1G/39/f39/W17yvzz0X3J5SJiXb3/\nT/HtPaKS6h5q8o2vY9Pr/rlbIUAHUVhY6Onpqaam5ubmJiYm5uvrW1xcHBQUpKqqSjsafACT\nySSEFBYW0g4CHVZmZqazs7OKioqzs/PDhw/t7e0TExOfPHni4eHRq1evt4dZWVllZ2d7e3sP\nHTq0trZWRUWFEBIQEODq6kovO8D7jh8/rqioOGnSJNpB/iIhIeHg4PD06dPw8HAFBQXUhAAA\nAAAdg5eXF4aLCr6uXbtevHhx1KhRfn5+Hh4etOMAAHQcQlAQLnBxW7NmzZo1ayZ3k3rvIQ67\nIeFNk5TiZDlRxrv3j9LvTgiJfd3Iv5QA/HL//n0HB4cBAwb4+fmpq6uHh4fn5eV5eHgoKCjQ\njgYfxS0IsQ0h8Fx5ebmfn9+AAQNGjBgRGho6cODAkJCQsrKyiIgIExMTBoPxz6coKSl5eXml\npKTk5uampaWJiIikpaXxPznAx9y9e/fx48dz586VkJCgneV979aE3bp1e1sTVlVV0Y4GAAAA\nAJ/t7t27u3fv1tPTW7t2Le0s8B+4HeGYMWN27NiBYbAAALwi3LsNsZqLm9kcBZnB790vryNP\nCMlt+O8VhCwW6/z58/++MRh30Q+bzf7yoAC8kJaW5ufnd/bsWULI2LFjPTw8LC0tP1gAgKBB\nQQi8xWKxkpOTQ0NDY2Nj29ralJWVXVxcFi9e/LkXvfbp08fAwCAuLq6+vr5Lly7tlBbgs0RG\nRhJCBGS+6AeJi4s7ODjMnTv3xIkTW7du9fHxCQgIWLZsmaenJ91NEwEAAADg02G4qNBRUFBI\nTEy0tLT09/dnsVi7du3COTEAgK8k3AUhu/U1IUREVP69+8VlxQkhDdX/XRAmJydbW1t/ynsV\nFBR8fkAAHmhtbT1x4sTOnTsfP34sLi5uY2Pj7u7+zTff0M4Fn0FdXZ2gIAReyM7ODgsLO3Lk\nyMuXL0VERIyMjJycnKZNm/bFf9Da2tqmpaUlJCTMmjWLt1EBvkBbW9vJkyc1NTVHjhxJO8t/\n4NaEdnZ2p06d2rBhg5+f3759+5YvX+7h4dGtWzfa6QAAAADgP2zatCkrK8vX13fw4PcXHoDA\n6tKly9mzZ62srAICAhobG/ft24eOEADgawh3QSgi1o0QwmbVvnd/a10rIURS7r//dYaGhnFx\ncf++gnDfvn1Xr17t16/fVyQF+BK1tbWHDx/etWtXSUmJnJyci4vL2rVr+/btSzsXfDZZWVlF\nRUUUhPDFGhsbz549GxoaeuXKFQ6HM2DAgKVLly5atEhNTe0rX9nGxmbVqlXR0dEoCEEQJCYm\nVlRU+Pj4CMvf+SIiIjY2NjNnzjx16tTGjRvf1oQ//PCDoqLifz8fAAAAAGi4ffv2rl27Ro0a\nheGiQofbEVpbWx84cIDNZu/fv19ERAi20AIAEEzCXRCKSqlLiTDaGp+9d3/ts1pCiGaX/15O\nISoqamVl9e/HnD9/nhCCDxvglaKiopSUlPLyckVFRQMDg//7v//75zEVFRUHDhwIDg7+448/\nuBuGubq6YkWCUGMymSgI4QtkZmaGhoaeOHGitrZWSkpq1qxZTk5OxsbGvKpPlJWVx40bd+7c\nubq6OllZWZ68JsAXO3r0KIPBmD9/Pu0gn+fdmnDTpk1+fn579+5dtGjRunXrlJSUaKcDAAAA\ngL9pbm7+7rvvxMTEDh06JCoqSjtOR8ZikStXiLEx4e1/ZhkZmbi4uGnTpoWGhrLZ7JCQEJy2\nBQD4MsL925Mh0mVSN6mmNxea/r4/4IPMSkLIjB7SdGIBfERlZeW8efP69+/v6Ojo6enp5OQ0\nePBgIyOj/Pz8t8c8evTI2dm5X79+Pj4+PXr0CAwMLCws9Pb2FsZ2kMUily4RFot2DsHAZDJL\nS0vb2tpoBwHh8ObNm9DQ0GHDho0YMSI0NFRLSyswMPDFixfR0dEmJia8XVw1e/bshoYG7v6m\nABTV19fHxcUZGBhoaGjQzvIluDVhVlZWXFycpqZmcHCwpqamq6trRUUF7WgAAAAA8JcNGzZk\nZWVt2bLlg1dsAw8lJJBJk0hCAu9fWUZGJj4+3tLS8pdfflmyZAmbzf7v5wAAwD8Id0FICFkx\nUZnV+mpHftXbe9itr/2Ka6R7TBstJ0ExGMB7qqurDQ0NT5w4YWFhER0dnZGRcfbs2UWLFqWk\npBgYGOTn56elpVlZWQ0bNiw0NFRfXz8uLi47O9vV1VVKSop29i/Ufl8EhRGTyWxraysrK6Md\nBAQam82+fPmyra2tsrKys7NzSUmJk5PTvXv3MjIyXF1d22li4axZs8TExKKjo9vjxQE+3a+/\n/lpXV2dvb087yFcRERGxsrLKzMyMi4sbMGDA25qwvLycdjQAAAAAILdu3QoICBg9evTq1atp\nZ+n4Ghv/+slzkpKSp06dsra2Pnz4sJ2dHS7IBgD4AkJfEI7e5c5gMH6es+PtIsJrO2a8aGaN\n3LCVai6A93l7ez969MjPzy8uLs7GxkZfX9/CwuLQoUOnT5/+/fff9fT0xo8ff/78eQsLi5s3\nb3LLQmHZgelj2vWLoNBhMpmEEEwZhY8pKSnx8/Pr37+/qanpqVOnJk6cGB4e/uLFi5CQEF1d\n3XZ96549e06cODEhIaG6urpd3wjg3x09elRCQuJftsMUooXp79aE2trawcHBAwYMcHV1xWUi\nAAAAABRhuGgHIyEhERMTM23atBMnTqAjBAD4AkJfEMqpLzvhPPRV5naNsTPWeXkttRlvuDGt\n26AFsSt0aEcD+EtLS0tYWJi+vr67u/vbO+vq6kJDQ93d3TkcTnV19dy5c58+fRofHz969GiK\nUaGdoCCED2pqaoqJiTE1NWUymZ6eniwWy8PD4/nz54mJiQ4ODtLSfJqVPXv27Kampvj4eP68\nHcA/lZWVJScnW1hYdO/e/WPHCN3CdAaDYWVllZGRERcXN3DgwODg4P79+zs7O6MmBAAAAKBi\n3bp1T5482bZtm44OTht2EBISElFRUTNmzIiKipo/f35rayvtRAAAwkToC0JCyOz9mWd2re5T\nmR603ffX6+WzV/o+un+om5hwL72CDiYnJ6e6utrCwoK7KLC1tXXDhg1qamrOzs41NTW2traE\nkOnTp2tpadFOCu1FXV2dEFJYWEg5BwiM9PT0pUuXKisr29rapqWlzZ0798qVK0VFRb6+vtz/\nW/hp+vTp4uLimDIKFB07dozFYtnZ2f3LMUK6MJ1bE6anp8fGxuro6ISGhmpqarq5uf2zJuQO\nGd68efMPP/ywc+fOu3fvUgkMAAAA0CHduHEjKChozJgxbm5utLMAL0lISJw8eXLmzJnR0dHo\nCAEAPosY7QCfYWF25cIPPyJqvXqX9epd/I0D8Blqa2sJId26dePevHjx4rZt27S0tPz8/Ozt\n7VNTU6Ojo2tqaqhmhPaFFYTAVVlZefTo0UOHDj169IgQoqent2jRonnz5r39/UBFjx49jIyM\nLl26VFVV1bVrV4pJoNM6evSooqKihYUF7SDthcFgTJs2berUqfHx8Vu2bAkKCgoJCVmyZImH\nh4eqqiohJCMjw8HB4enTp+8+y9TUNCwsjHsAgMBqbW198eIFIURVVVVcXJx2HAAAgA9obGxc\nuHChhIREWFgYhot2POLi4idPnrSzs4uKimprazt58qSEhATtUAAAQqAjrCAEEHzKysrkndVj\n6enphJATJ04sWbJESkqqoKDg7THQUXXv3l1WVhYFYafFZrMvXrw4e/ZsVVVVNze30tLSlStX\n3r17NzMzc8WKFXTbQS5bW9vm5ubffvuNdhDojB4+fPjw4UMbGxtJSUnaWdoXg8GwtrZOT08/\n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\n2PDSMHoI4U1vetMxxxxz6623Ll++PISQ/Tpu3LgYE/Yd2f9L2U/nAAAAQJ4oCAE4gAEDBowa\nNWrFihXpdPqFF15wACEAB6umpqauru6HP/zhtm3bso/MmTOnra3t2muvzWQyt99+e2Vl5THH\nHBNvyD4iiqIQgjMIAQAAyCsFIQAHlkqlWlpasodFKQgB6IZLL7107dq1J5100pYtW0II73rX\nu6ZNm3brrbfOnj37V7/61VlnnfXyAtISl10xqiAEAAAgryriDgBAAaitrX366af/+te/BgUh\nAN1y6qmn/uEPf/jmN7956KGH/su//MvkyZOHDx/e1tZ22223vf3tb7/++uvjDthXpNPp8vLy\nCRMmxB0EAACAYqYgBODAUqlUR0fHz3/+86AgBKBbEonEN77xjWOOOea666675ZZbsg9WVVW1\nt7ffeOONAwYMiDde3xFF0fjx4ysrK+MOAgAAQDGzYhSAA0ulUiGExx57bMCAAclkMu44ABSq\nj33sY3/+85/XrVv39NNPR1H00EMPdXR0GB/cUzqd9qsWAACAfFMQArA/7e3tN91009e//vUQ\nwrZt2zo6Oi6++OJVq1bFnQuAAjZmzJg3vvGNyWTy2GOPffvb3/7tb3972bJlcYfqE3bv3r1u\n3ToHEAIAAJBvCkIAXtXWrVuPPfbYM888M51OZx/p16/fDTfc8PrXv/6Xv/xlvNkAKA5z585t\na2u76qqr4g7SJ6TT6c7OTgUhAAAA+aYgBOBVnXrqqb/61a8uuOCCxsbG7CPnn3/+vffeG0I4\n8cQTzREC0HPTp09/xzvecfvttzc3N8edJX5RFIUQrBgFAAAg3xSEAOzbn/70p3vuueejH/3o\nDTfcMGHChKFDh4YQ6uvrZ82adccddzz//POOjAIgJxYuXNjR0XHNNdfEHSR+2YLQBCEAAAD5\npiAEYN8eeOCBEMIFF1yQ/TaVSoUQ6uvrQwgzZ85saGh48MEHY4wHQNH453/+5+nTp3/7299u\namqKO0vMsju9FYQAAADkm4IQgH3Lvkf52te+NvttbW1teKkgzD4eRVEmk4kpHQBFZd68eR0d\nHVdffXXcQWK2cuXKEEJ1dXXcQQAAAChyCkIA9q1///4hhNbW1uy355133pw5c0aOHJn9trW1\ntX///olEIrZ8ABSRadOmHXvssXfccUeJn0QYRdHAgQNHjRoVdxAAAACKnIIQgH173eteF0J4\n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\nhwizBaEJQgAAAOKiIAQAAErC+PHjTz/99CeffPLBBx+MN4kzCAEAAIiXghAAACgVl1566YAB\nA+bOnRvvEGEURUOGDBk6dGiMGQAAAChlCkIAAKBUjB8//owzznjqqaceeOCBGGNEUWR8EAAA\ngBhVxB0AgNhcf3249tquXtzWFkIIs2eHs87q0vWTJoUnn+xmMADIn0svvfTmm2+eO3fu+973\nvkQi0fsBMpnMypUrp0+f3vsvDQAAAFkKQoDSdfjh4bjjunpxJhPWrw9jxoQuvpU6aVK3cwFA\nHo0bN+7MM8/8j//4j/vvv3/WrFm9H2DDhg2tra0mCAEAAIiRghCgdL33veG97407BAD0uksu\nueTGG2+cN2/eCSec0PtDhFEUhRCSyWQvvy4AAAC8zBmEAABAaRk3btxZZ5319NNP33fffb3/\n6ul0OoRgghAAAIAYKQgBAICSc8kllwwcOHDOnDmdnZ29/NImCAEAAIidghAAACg5Y8eOPfvs\ns5955pl77723l1/aBCEAAACxUxACAACl6NJLLz3kkEOuvPLKXh4ijKKorKxs4sSJvfmiAAAA\nsCcFIQAAUIpGjRp19tln/+Uvf/nJT37Sm68bRdG4ceP69evXmy8KAAAAe1IQAgAAJeqSSy7p\n/SHCdDptvygAAADxUhACAAAlatSoUeecc85f//rXe+65p3decffu3WvXrlUQAgAAEC8FIQAA\nULq+8IUvDB48eO7cub0zRLhy5crOzk4FIQAAAPFSEAIAAKXr5SHCH/3oR73wcul0OoSQTCZ7\n4bUAAADg1SgIAQCAkpYdIpw/f34vDBFGURQUhAAAAMRNQQgAAJS0kSNHnnvuuX/9619/+MMf\n5vu1sgWhFaMAAADES0EIAACUun/913/tnSHC7IpRBSEAAADxKraCsHP32gvPPmvh/em4gwAA\nAAVj5MiRn/3sZ//3f//37rvvzusLRVHUv3//UaNG5fVVAAAAYP+KrSC88/S3/8c3b/zJU5vi\nDgIAABSSiy66qBeGCNPpdE1NTSKRyN9LAAAAwAEVVUG48qcXfeI7TXGnAAAACs/IkSPPO++8\n//u///vBD36Qv1eJosh+UQAAAGJXPAXh7m1/PO6DXxn2/42OOwgAAFCQLrrooiFDhsydO7ej\noyMf99+yZcvWrVsVhAAAAMSuaArCzvnvmtVSccTi26bHnQQAAChII0aMOO+885qamr7//e/n\n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\ne5944om4cwEAAMDfKQgBAAByZtmyZTt37ty+fftDDz2UXTR6//33H3XUUeedd15nZ2fc6QAA\nACAEBSEAAECubNmy5fjjj9+8efPw4cOHDh06bdq0EMIf//jH44477qtf/eqll14ad0AAAAAI\nQUEIAACQK1/+8pejKPra17523XXXbd68+b777hs5cuRb3vKWBx98cOrUqTfccENLS0vcGQEA\nAEBBCAAAkCN33313bW3t7NmzTz311EmTJmUymZqamhBCv3795syZ09bW9pOf/CTujAAAAKAg\nBAAAyIXOzs5ly5YdeeSRiUSisrLysssuCyEkk8nsT9/85jeHEJYuXRpnRAAAAAghhFARdwAA\nAIAi9KlPfeqBBx744Ac/GHcQAAAA2JuCEAAAIAfKysomT5785JNPZjKZ7BDhngtFn3jiiRBC\nXV1dfAEBAADgRVaMAgAA5MaHPvShlpaWm2++ea/Hd+/evXDhwsrKyhNPPDGWYAAAALAnBSEA\nAEBuXHzxxalU6jOf+czVV1+9devW7IN//vOfZ86c+fvf//7iiy+ura2NNSAAAACEoCAEAADI\nlaFDhy5ZsmTKlCmXX375yJEj6+rqxo8f/4Y3vOHRRx8977zzFi1aFHdAAAAACMEZhAAAADlU\nX1//9NNP33nnnQ8++ODy5cvHjBnzwQ9+8LTTTjvyyCPjjgYAAAAvUhACAADkUlVV1WmnnXba\naafFHQQAAAD2zYpRAAAAAAAAKCEKQgAAAAAAACghCkIAAAAAAAAoIQpCAAAAAAAAKCEKQgAA\nAAAAACghCkIAAAAAAAAoIQpCAAAAAAAAKCEKQgAAAAAAACghCkIAAAAAAAAoIQpCAAAAAAAA\nKCEKQgAAAAAAACghCkIAAAAAAAAoIQpCAAAAAAAAKCEKQgAAAAAAACghCkIAAAAAAAAoIQpC\nAAAAAAAAKCEKQgAAAAAAACghCkIAAAAAAAAoIQpCAAAAAAAAKCEKQgAAAAAAACghCkIAAAAA\nAAAoIQpCAAAAAAAAKCEKQgAAAAAAACghCkIAAIDc6+gIS5aEjo64cwAA/4+9+46Polr/OH4m\nu5teIAldinThUlREERAQpEeKJAECoqI/hQsWLIiKvSuoWFAQATFZEooNECliAQQpAqKINEEQ\nIRBqenbn98dCbkxgswm7O5lzPu8/7usyO3Cf7z2zs2fPszMDAABKoEEIAAAAAN731VeiRw/x\n1VdG1wEAAAAAQAk0CAEAAADA+7Kz//efAAAAAABUKDQIAQAAAAAAAAAAAIXQIAQAAAAAAAAA\nAAAUQoMQAAAAAAAAAAAAUAgNQgAAAAAAAAAAAEAhNAgBAAAAAAAAAAAAhdAgBAAAAAAAAAAA\nABRCgxAAAAAAAAAAAABQCA1CAAAAAAAAAAAAQCE0CAEAAAAAAAAAAACF0CAEAAAAAAAAAAAA\nFEKDEAAAAAAAAAAAAFAIDUIAAAAAAAAAAABAITQIAQAAAAAAAAAAAIXQIAQAAAAAAAAAAAAU\nQoMQAAAAAAAAAAAAUAgNQgAAAAAAAAAAAEAhNAgBAAAAAAAAAAAAhdAgBAAAAAAAAAAAABRC\ngxAAAAAAAAAAAABQCA1CAAAAAAAAAAAAQCE0CAEAAAAAAAAAAACF0CAEAAAAAAAAAAAAFEKD\nEAAAAAAAAAAAAFAIDUIAAAAAAAAAAABAITQIAQAAAAAAAAAAAIXQIAQAAAAAAAAAAAAUQoMQ\nAAAAAAAAAAAAUAgNQgAAAAAAAAAAAEAhNAgBAAAAAAAAAAAAhdAgBAAAAAAAAAAAABRCgxAA\nAAAAAAAAAABQCA1CAAAAAAAAAAAAQCE0CAEAAAAAAAAAAACF0CAEAAAAAAAAAAAAFEKDEAAA\nAAAAAAAAAFAIDUIAAAAAAAAAAABAITQIAQAAAAAAAAAAAIXQIAQAAAAAAAAAAAAUQoMQAAAA\nAAAAAAAAUAgNQgAAAAAAAAAAAEAhNAgBAAAAAAAAAAAAhdAgBAAAAAAAAAAAABRCgxAAAAAA\nAAAAAABQCA1CAAAAAAAAAAAAQCE0CAEAAAAAAAAAAACF0CAEAAAAAAAAAAAAFEKDEAAAAAAA\nAAAAAFAIDUIAAAAAAAAAAABAITQIAQAAAAAAAAAAAIXQIAQAAAAAAAAAAAAUQoMQAAAAAAAA\nAAAAUAgNQgAAAAAAAAAAAEAhNAgBAAAAAAAAAAAAhdAgBAAAAAAAAAAAABRCgxAAAAAAAAAA\nAABQCA1CAAAAAAAAAAAAQCE0CAEAAAAAAAAAAACF0CAEAAAAAAAAAAAAFEKDEAAAAAAAAAAA\nAFAIDUIAAAAAAAAAAABAITQIAQAAAAAAAAAAAIXQIAQAAAAAAAAAAAAUQoMQAAAAAAAAAAAA\nUAgNQgAAAAAAAAAAAEAhNAgBAAAAAAAAAAAAhdAgBAAAAAAAAAAAABRCgxAAAAAAAAAAAABQ\nCA1CAAAAAAAAAAAAQCE0CAEAAAAAAAAAAACF0CAEAAAAAAAAAAAAFEKDEAAAAAAAAAAAAFAI\nDUIAAAAAAAAAAABAITQIAQAAAAAAAAAAAIXQIAQAAAAAAAAAAAAUQoMQAAAAAAAAAAAAUAgN\nQgAAAAAAAAAAAEAhNAgBAAAAAAAAAAAAhdAgBAAAAAAAAAAAABRCgxAAAAAAAAAAAABQCA1C\nAAAAAAAAAAAAQCE0CAEAAAAAAAAAAACF0CAEAAAAAAAAAAAAFEKDEAAAAAAAAAAAAFAIDUIA\nAAAAAAAAAABAITQIAQAAAAAAAAAAAIXQIAQAAAAAAAAAAAAUQoMQAAAAAAAAAAAAUAgNQgAA\nAAAAAAAAAEAhNAgBAAAAAAAAAAAAhdAgBAAAAAAAAAAAABRCgxAAAAAAAAAAAABQCA1CAAAA\nAAAAAAAAQCE0CAEAAAAAAAAAAACF0CAEAAAAAAAAAAAAFEKDEAAAAAAAAAAAAFAIDUIAAAAA\nAAAAAABAITQIAQAAAAAAAAAAAIXQIAQAAAAAAAAAAAAUQoMQAAAAAAAAAAAAUIjV6AIAAAAA\nwDRWrBB793q056ZN5/Y/ccLTf7xPH1GrVjkLAwAAAADAczQIAQAAAMAjui769RNZWWX4K9Om\nlWHn++8Xb7xR1qIAAAAAACgzGoQAAAAA4BFNEz/9JA4f9mhnp1P8/LO48koR4PGDHa65ptyl\nAQAAAABQBjQIAQAAAMBTzZuL5s093bl7d1+WAgAAAABAeXn8W1YAAAAAAAAAAAAA5keDEAAA\nAAAAAAAAAFAIDUIAAAAAAAAAAABAITQIAQAAAAAAAAAAAIXQIAQAAAAAAAAAAAAUQoMQAAAA\nAAAAAAAAUAgNQgAAAAAAAAAAAEAhNAgBAAAAAAAAAAAAhdAgBAAAAAAAAAAAABRCgxAAAAAA\nAAAAAABQCA1CAAAAAAAAAAAAQCE0CAEAAAAAAAAAAACF0CAEAAAAAAAAAAAAFEKDEAAAAAAA\nAAAAAFAIDUIAAAAAAAAAAABAITQIAQAAAAAAAAAAAIXQIAQAAAAAAAAAAAAUQoMQAAAAAAAA\nAAAAUAgNQgAAAAAAAAAAAEAhMjQInfnpUx+/p22TelGhgWGVqlxzY/z0r3cbXRQAAAAAAAAA\nAABQEZm+QegsOHZH6yajX/zg99yqcUNu63Ftk1++W3B3r6a3f7jd6NIAAAAAAAAAAACACsf0\n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\niYkDerULt0g1kVftZ7kFZzPygyuHWM8N4onfVrz61sdb9x6uXPeKq9v3HjWiR4iZ+76K3M+Z\nG4MUOr5rvd1ut6ekrN2ZbuoJ7ecPte8/aa0WENTroTWLX7laCKFpWqX6ry//qNmGDWs/mjR5\ny6maKw9uvyE6yOhKL4kKMdX5mQKTWxdpzkKlcuTsrhrZxFHrqZP7njS6Fl+RiHoeCQAAIABJ\nREFUYzTVubmfIisJW7dudfOqsyD/5NF9i2Y8M3nBr41uXfrH7B5+K8wQrCSYl8TXgwrZv2Lr\nzsxH+rR8fenewi2aZr118vez7m9nYFWGkGAupM4kAWVFgxBGKvUHcZbA6B53PDxzyiOmXppn\nDUVK0t8k7dzNB0JrdB8waGDfjpXcvgdvueUWf9XlZer8LPevb6cPGf3cut8POrXgzoPH2Wc9\na9vxYdM2o9PzHYX7VL9u5Jbvp1Uz7flWkfs5c2MQyZ62eHrvlOiG91sjWy/YuKpPwyjXxqKT\nhIKsnYObXrMiaODRP2aZ96fWisRU5GcKQvnJrWRnoVLpzsx3br3y3uRdN836Y9mIRkaX42VS\njqYKN/dTZCXBI3rBrTUqpeW0zjm52uhS4BHpVxLckOx6UBW+Yv/yWseWj6y2BtcZ9dA9LeuE\n/77u8zdnfuPUrB/8efyu2hFGV+c/Ms2FVJgkoKxoEMJIcXFxbl7NPXFo06ZfMnIKqrUbd3DN\nJKtpV4sUWUP55Wx+i3CbJ3ue2bsior6pP3VUuEmap50zF/N+lCjys9xjP79Ws834fKceWaNh\nNS1919+n6sZ90OXnh5Izaj7+9ot9rmmceWjH+0+Pmbv+aPOx322fcoPR9ZaTIvdzVvbGILI+\nbfGzHnUGLPvr+W3HH28RXbix2CTh9N53ohqMHZC6Z2FCfYPKvFSKxFTkZwpCmcltMbKehYYP\nH+7mVUdu5o71K7YcOBPVYPCBnSmRstxJQtbR/Bepb+6nyEqCh5Z1q93r2xOOgrNGF1JOrCQU\nJcFKgickuB5Uka/Yt1YP/yQ976Pdx267PNK1Zd1z7do9ua7JHat/n9He2Nq8SMW5kNSTBJQV\nDUJUaI7sAxN6X/fat4cTF++f27uO0eWUkyJrKFGX9/th2/yWEe5n9s6lbz8w7MF3j+UV+Kks\nH1DhJmlCiFdeecXzncePH++7Soxn/p/lvtosZvyOjDunrZ1+VzshxE8fjb525FQhxH9XHnrn\n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\nFmPDpwAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 720,
       "width": 1200
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "library(gplots)\n",
    "plotmeans(TPT~Daerah , main = \"Daerah X TPT\", data = data1, las=2)\n",
    "\n",
    "ggsave(\"output/daerah x tpt.png\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e3ac0a7e",
   "metadata": {
    "papermill": {
     "duration": 0.016887,
     "end_time": "2023-05-14T08:05:04.421480",
     "exception": false,
     "start_time": "2023-05-14T08:05:04.404593",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Tahun X TPT"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "e60a4139",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:04.454589Z",
     "iopub.status.busy": "2023-05-14T08:05:04.453334Z",
     "iopub.status.idle": "2023-05-14T08:05:05.221816Z",
     "shell.execute_reply": "2023-05-14T08:05:05.220568Z"
    },
    "papermill": {
     "duration": 0.78705,
     "end_time": "2023-05-14T08:05:05.223859",
     "exception": false,
     "start_time": "2023-05-14T08:05:04.436809",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22mSaving 12.5 x 6.67 in image\n"
     ]
    },
    {
     "data": {
      "image/png": "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\n256b3Wvqvbfe/Uh5ZaxV30HfyWga74kAAAAAAAAgwSRSIGzXJ/O6CZmDW783YMyC3lfeN+vy\no+M9EQAAAAAAACSY5HgPsN/6XnlnvEcAAAAAAACARJV4gbBR88wTO7Zv0SQl3oMAAAAAAABA\n4kmkR4zusfD9tfEeAQAAAAAAABJS4t1BCAAAAAAAABwwgRAAAAAAAAACIhACAAAAAABAQARC\nAAAAAAAACIhACAAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAA\nEBCBEAAAAAAAAAKSGu8BAAAAgIZo8eJow4ZaHVlVFS1eHPXrFyXX7veQk5KigQOjww47mOkA\nAIADJxACAAAAX7ZpUzRgQFRVVVfr3357dOONdbU4AABQM4EQAAAA+LJWraLHH4/WravVwQsX\nRn/8Y/Tzn0f9+9fq+OTk6OyzD2Y6AADgoAiEAAAAwD5kZ9f2yEcfjf74x+gHP4iGD6/LgQAA\ngEOkdi8HAAAAAAAAAL4RBEIAAAAAAAAIiEAIAAAAAAAAAREIAQAAAAAAICACIQAAAAAAAARE\nIAQAAAAAAICACIQAAAAAAAAQEIEQAAAAAAAAAiIQAgAAAAAAQEAEQgAAAAAAAAiIQAgAAAAA\nAAABEQgBAAAAAAAgIAIhAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABAQgRAAAAAAAAACIhAC\nAAAAAABAQARCAAAAAAAACIhACAAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAERCAEAAAAAACA\ngAiEAAAAAAAAEBCBEAAAAAAAAAIiEAIAAAAAAEBABEIAAAAAAAAIiEAIAAAAAAAAAREIAQAA\nAAAAICACIQAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAQEIEQAAAAAAAAAiIQAgAAAAAAQEAE\nQgAAAAAAAAiIQAgAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAA\nABAQgRAAAAAAAAACIhACAAAAAABAQARCAAAAAAAACIhACAAAAAAAAAERCAEAAAAAACAgAiEA\nAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAEBCBEAAAAAAAAAIiEAIAAAAAAEBABEIAAAAAAAAI\niEAIAAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAQEIEQAAAA\nAAAAAiIQAgAAAAAAQEAEQgAAAAAAAAiIQAgAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABEQg\nBAAAAAAAgIAIhAAAAAAAABAQgRAAAAAAAAACIhACAAAAAABAQARCAAAAAAAACIhACAAAAAAA\nAAERCAEAAAAAACAgAiEAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAEBCBEAAAAAAAAAIiEAIA\nAAAAAEBABEIAAAAAAAAIiEAIAAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAREIAQAAAAAAICA\nCIQAAAAAAAAQEIEQAAAAAAAAAiIQAgAAAAAAQEAEQgAAAAAAAAiIQAgAAAAAAAABEQgBAAAA\nAAAgIAIhAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABAQgRAAAAAAAAACIhACAAAAAABAQARC\nAAAAAAAACIhACAAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAA\nEBCBEAAAAAAAAAIiEAIAAAAAAEBABEIAAAAAAAAIiEAIAAAAAAAAAREIAQAAAAAAICACIQAA\nAAAAAAREIAQAAAAAAICACIQAAAAAAAAQEIEQAAAAAAAAAiIQAgAAAAAAQEAEQgAAAAAAAAiI\nQAgAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABAQgRAAAAAA\nAAACIhACAAAAAABAQARCAAAAAAAACIhACAAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAERCAE\nAAAAAACAgAiEAAAAAAAAEBCBEAAAAAAAAAIiEAIAAAAAAEBABEIAAAAAAAAIiEAIAAAAAAAA\nAREIAQAAAAAAICACIQAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAQEIEQAAAAAAAAAiIQAgAA\nAAAAQEAEQgAAAAAAAAiIQAgAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABEQgBAAAAAAAgIAI\nhAAAAAAAABAQgRAAAAAAAAACIhACAAAAAABAQARCAAAAAAAACIhACAAAAAAAAAERCAEAAAAA\nACAgAiEAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAEBCBEAAAAAAAAAIiEAIAAAAAAEBABEIA\nAAAAAAAIiEAIAAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAQ\nEIEQAAAAAAAAApIa7wEAAAAAgAZt3rzoySdre3AsFq1aFXXuHCUl1er4446LLrzwgEcDAA6E\nQAgAAAAA1OQ//zN64IG6Wrx3b4EQAOqbQAgAAAAA1GTy5OiWW2p7cElJ9MtfRn/4Q3TmmbU6\n/ogjDnguAOAACYQAAAAAQE3S0qKuXWt7cLt2u/+s/SkAQD1LjvcAAAAAAAAAQP0RCAEAAAAA\nACAgAiEAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAEBCBEAAAAAAAAAIiEAIAAAAAAEBABEIA\nAAAAAAAIiEAIAAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAQ\nEIEQAAAAAAAAAiIQAgAAAAAAQEAEQgAAAAAAAAiIQAgAAAAAAAABEQgBAAAAAAAgIAIhAAAA\nAAAABEQgBAAAAAAAgIAIhAAAAAAAABAQgRAAAAAAAAACIhACAAAAAABAQARCAAAAAAAACIhA\nCAAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAEBCBEAAAAAAA\nAAIiEAIAAAAAAEBABEIAAAAAAAAIiEAIAAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAREIAQA\nAAAAAICACIQAAAAAAAAQEIEQAAAAAAAAAiIQAgAAAAAAQEAEQgAAAAAAAAiIQAgAAAAAAAAB\nEQgBAAAAAAAgIAIhAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABAQgRAAAAAAAAACIhACAAAA\nAABAQARCAAAAAAAACIhACAAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAERCAEAAAAAACAgAiE\nAAAAAAAAEBCBEAAAAAAAAAIiEAIAAAAAAEBABEIAAAAAAAAIiEAIAAAAAAAAAREIAQAAAAAA\nICACIQAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAQEIEQAAAAAAAAAiIQAgAAAAAAQEAEQgAA\nAAAAAAiIQAgAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABAQ\ngRAAAAAAAAACIhACAAAAAABAQARCAAAAAAAACIhACAAAAByU9PS9fwIAAA1farwHAAAAABLb\n0KHRM89Ep54a7zkAAIDaEQgBAACAg5KSEp1+eryHAAAAas0jRgEAAAAAACAgAiEAAAAAAAAE\n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\nVFy4MDs7+4QTTigqKqqoqDhUowIAAPskEAIAAAD7Yfz48WvXrr3tttu+6o2D+6V79+6FhYUr\nV64cO3bsmjVrcnNze/ToUVhYuG3btoNfHAAA2CeBEAAAAKit999/v6Cg4Pjjj//pT396CJdt\n3759fn7+6tWrCwoKdu7cOXr06IyMjPz8/A0bNhzCqwAAANUEQgAAAKC2rr/++m3btk2YMCEl\nJeWQL968efO8vLz33ntv2rRprVu3HjduXOfOnfPy8tasWXPIrwUAACETCAEAAIBaefnll2fM\nmDFs2LDTTjut7q7SuHHjnJyct99+e+bMmcccc8zEiRO7d++ek5OzZMmSursoAAAERSAEAAAA\nvl4sFhs9enRaWtodd9xRD5dLTk7OysqaP39+aWnpkCFDiouL+/btm5WV9eKLL9bD1QEA4JtN\nIAQAAAC+XnFx8YIFC0aNGtWzZ8/6vG5mZuasWbMWL1580UUXzZ49OzMzc8CAAUVFRVVVVfU5\nBgAAfJMIhAAAAMDXKC8v//Wvf33EEUfcfPPNcRnghBNOKCoqeuedd0aNGvXWW2/l5ub26tWr\nsLBw+/btcZkHAAASmkAIAAAAfI3bb799zZo148aNa9myZRzH6Nq1a2Fh4apVq8aOHbthw4bR\no0d36dIlPz+/rKwsjlMBAEDCEQgBAACAmnz44Yd33nnnMccc87Of/Szes0RRFB155JH5+fmr\nV68uKChITU0dN25cp06d8vLy1q5dG+/RAAAgMQiEAAAAQE1uvPHGrVu33nXXXampqfGeZa9m\nzZrl5eWtWLFi2rRpHTp0mDhxYpcuXXJyct555514jwYAAA2dQAgAAAB8pfnz50+fPv2ss84a\nMmRIvGfZh0aNGuXk5Lz55pszZ87s169fcXFx7969s7KyXn311XiPBgAADZdACAAAAOxbLBa7\n9tprU1JSbr/99njPUpPk5OSsrKyXX365tLT0zDPPfOqpp7797W9nZmbOmjUr3qMBAEBDJBAC\nAAAA+/bwww+/+OKLV111VZ8+feI9S61UR8G//e1vF1988fz587Ozs0888cSioqLKysp4jwYA\nAA2IQAgAAADsQ3l5+ZgxY1q1anXLLbfEe5b9c9xxxxUVFb377rujRo1atmxZbm5uz549CwsL\ny8vL4z0aAAA0CAIhAAAAsA8TJkxYvXr1uHHj2rRpE+9ZDkTnzp0LCwtXr149duzYsrKy0aNH\n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\naP127tw5derUz3zmM+PGjQvdwofo2LFjNBpdv359TU1N7969Kysre/XqFY1G161bFzoNAIBW\nwkAIAAAArV9paelrr702a9asTp06hW7hI0lPTy8oKHjmmWeWLl162WWXVVdX9+/fv6Cg4Kmn\nngqdBgBAi2cgBAAAgFaurq7urrvuuuiii772ta+FbuFjy8/Pr62tXbly5TXXXLNkyZKLL774\nvStNTU2h0wAAaKkMhAAAANDKjRs3bv/+/XPmzElLSwvdwic0aNCgVCpVV1c3evTolStXFhYW\nnnPOOalUat++faHTAABoeQyEAAAA0Jr97ne/W7x48TXXXHPxxReHbuHT6tmzZzKZ3LJlS0lJ\nyUsvvVRUVHTGGWckk8m33347dBoAAC2JgRAAAABarQMHDsTj8aOPPnratGmhWzhksrOzE4nE\n1q1bKyoq9u/fH4/Hc3NzE4nEa6+9FjoNAICWwUAIAAAArdY999yzevXqCRMmdOvWLXQLh1jn\nzp1jsdimTZuqqqpOOOGE0tLSnJycf/u3f9uwYUPoNAAAmjsDIQAAALROu3fvnjp1ateuXYuL\ni0O3cLh06NAhGo2uW7eupqbmrLPOuvfee3v37l1QUPDss8+GTgMAoPkyEAIAAEDrNHXq1Fdf\nfXXGjBmZmZmhWzi80tPTCwoKnn766aVLlw4dOnTx4sXnn39+fn5+bW1t6DQAAJojAyEAAAC0\nQhs3bvzhD384aNCga665JnQLR857o+Bzzz03atSo5cuXFxYWnnvuualU6sCBA6HTAABoRgyE\nAAAA0AqNGzfu3XffraioSE939m9zzjnnnFQqVV9fP3r06BdeeKGoqKh3797JZHLv3r2h0wAA\naBYcEgAAAKC1efTRRx9++OGvfe1rn/vc50K3EEz37t2TyWRDQ0NJScnrr78ej8dzc3MTicQb\nb7wROg0AgMAMhAAAANCqHDx4sLi4+KijjpoxY0boFsI76aSTEolEQ0NDRUVF+/btS0tLc3Jy\nYrHY9u3bQ6cBABCMgRAAAABalR//+McrV64cN25cbm5u6Baai6ysrFgstnHjxqqqqs985jOV\nlZU9evSIRqN1dXWh0wAACMBACAAAAK3Hm2++WVJSkp2dPWHChNAtNDsdOnSIRqOrV6+uqak5\n99xzq6ur+/btW1BQsGLFitBpAAAcUQZCAAAAaD2mTZv2pz/9acaMGV26dAndQjOVnp5eUFDw\n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\nuLj4qKOOmjlzZugWoNk555xzUqlUfX396NGj169fX1RUdOaZZyaTyb1794ZO+4S+/OXIf/93\n5MtfDt0BAPxjBkIAAAA4vObNm7dy5cpx48bl5uaGbgGaqe7duyeTyS1btpSUlOzcuTMej+fm\n5iYSiTfeeCN02sfWrl3ksssi7dqF7gAA/jEDIQAAABxGb775ZklJSXZ29oQJE0K3AM3dSSed\nlEgkGhoaKioqOnToUFpa2q1bt1gstn379tBpAECrYiAEAACAw2jatGmvvPLK9OnTu3TpEroF\naBmysrJisdiLL75YVVV1+umnV1ZWdu/ePRqN1tXVhU4DAFoJAyEAAAAcLps3b04mkwMGDPjm\nN78ZugVoYTp06BCNRtesWVNTU3PeeedVV1f37du3oKBg+fLlodMAgBbPQAgAAACHy4QJE/bu\n3VtRUZGe7gAOfBJpaWkFBQVPPvnk0qVLhw4dunjx4osuuig/P7+2trapqSl0HQDQUjmfAAAA\nwGHx1FNP/fKXv/zqV786ZMiQ0C1Ai/feKPj888+PGjVqxYoVhYWFAwcOTKVS+/fvD50GALQ8\nBkIAAAA49A4ePBiLxdq3bz9jxozQLUDr0b9//1QqtWHDhtGjR7/44otFRUV5eXnJZHLPnj2h\n0wCAlsRACAAAAIdeVVXVs88+O2bMmDPOOCN0C9Da5OTkJJPJLVu2zJw5c8+ePfF4PDc3N5FI\nvP7666HTAICWwUAIAAAAh9hbb711yy23nHzyyZMnTw7dArRaJ5544sSJE7ds2VJVVXXMMceU\nlpbm5OTEYrGXX345dBoA0NwZCAEAAOAQmzlz5vbt22+//fZjjjkmdAvQynXs2DEaja5fv76m\npqZ3796VlZU9e/aMRqPr1q0LnQYANF8GQgAAADiUXn755fLy8n79+l133XWhW4C2Ij09vaCg\n4Jlnnlm6dOlll11WXV3dv3//goKCZcuWhU4DAJojAyEAAAAcSsXFxe+88055eXlGRkboFqDN\nyc/Pr62tXbly5TXXXLNkyZLPfvaz711pamoKnQYANCMGQgAAADhkli1bNn/+/GHDhn3xi18M\n3QK0XYMGDUqlUnV1daNHj165cmVhYeE555yTSqX2798fOg0AaBYMYm4jigAAIABJREFUhAAA\nAHBoNDU1xePx9u3bz5o1K3QLQKRnz57JZHLLli0lJSUvvfRSUVFRr169ksnk22+/HToNAAjM\nQAgAAACHxk9/+tMVK1Z8//vfz8vLC90C8FfZ2dmJRKKhoaGiomLfvn3xeDw3NzeRSLz22muh\n0wCAYAyEAAAAcAjs2bPnlltuOf7446dMmRK6BeDvdenSJRaLbdq0qaqq6oQTTigtLc3JyYnF\nYlu3bg2dBgAEYCAEAACAQ6CsrGzr1q2333778ccfH7oF4IN17NgxGo2uW7eupqbmrLPOqqys\n7NWr18iRI1euXBk6DQA4ogyEAAAA8Glt27Ztzpw5ffr0ueGGG0K3AHyI9PT0goKCp59+eunS\npZdffvkDDzxw3nnn5efn19bWhk4DAI4QAyEAAAB8WpMmTXr77bfLy8szMjJCtwB8VO+NgqtW\nrRo1atTy5csLCwvPPffcVCp14MCB0GkAwOFlIAQAAIBPZfny5T/72c++8pWvXH755aFbAD62\nAQMGpFKp+vr60aNHv/DCC0VFRb17904mk3v37g2dBgAcLgZCAAAA+OSamprGjx/frl27srKy\n0C0An1z37t2TyeSWLVtKSkpef/31eDzevXv3RCLxxhtvhE4DAA49AyEAAAB8cr/4xS9+//vf\n33TTTf369QvdAvBpnXzyyYlEoqGhoaKiIiMjo7S0NCcnJxaLbd++PXQaAHAoGQgBAADgE9qz\nZ8/kyZOPO+64W2+9NXQLwCGTlZUVi8U2btxYVVXVtWvXysrKHj16RKPRurq60GkAwKFhIAQA\nAIBPaM6cOQ0NDYlE4oQTTgjdAnCIdejQIRqNrlmzpqamZtCgQdXV1X379i0oKFixYkXoNADg\n0zIQAgAAwCfx6quvzp49u3fv3t/97ndDtwAcLunp6QUFBU899dTSpUuHDh26ePHiCy+8MD8/\nv7a29v+/eePGjXfcccfXv/71r371qxMnTly2bNmRDwYAPoqM0AEAAADQIk2aNOnNN9+88847\n27dvH7oF4LDLz8/Pz89fvXr17Nmzf/7znxcWFg4YMGDMmDHXXHNNu3btDh48ePPNN8+ePfvA\ngQORSCQjI2P//v2zZs268sor77vvvmOOOSZ0PgDwPt4gBAAAgI/tueeeS6VSn//854cOHRq6\nBeDI6d+/fyqVevHFF0ePHl1fX19UVJSXl5dMJouLi2fOnHn++ef/9re/bWxsbGxsfO655772\nta89+OCDV1555cGDB0OHAwDvYyAEAACAjy0ej6elpZWXl4cOAQggJycnmUw2NDSUlJTs2rUr\nHo/PnTv39NNPf/DBB7/whS+0b98+LS1twIABP//5z7/3ve89+uijP/vZz0InAwDvYyAEAACA\nj2fhwoVPPPHEd77znf79+4duAQjmxBNPTCQSDQ0NX/rSlyKRyEsvvZSXlxeLxV5++eX/d8+0\nadOOPvro+++/P1wmAPABDIQAAADwMezdu3fixInHHntsSUlJ6BaA8DIzM7t06dKuXbv77rsv\nJyensrKyV69e48ePb2pqikQiXbp0Ofvss9etWxc6EwB4HwMhAAAAfAzJZHLz5s233nrrSSed\nFLoFoFlobGxs165dUVHRH//4x9ra2rPPPvvOO++cO3fue9/t0KHDvn37whYCAH/HQAgAAAAf\n1Y4dO6ZPn96zZ8+bbropdAtAc5Gbm9vY2FhfX5+WlvYv//Ivjz76aL9+/SZNmvT4448fOHBg\n3bp1ubm5oRsBgPcxEAIAAMBHdfPNN+/evXvu3LkdO3YM3QLQXBQWFkYikbKysvf+mZmZ+eCD\nD2ZmZl599dV33nnna6+99t4NAEDzYSAEAACAj+T555+/7777Lr30Uj/pBvifLr300i9/+cv3\n3XdfPB7fvXt3JBI544wz/vM//3PHjh2TJ0/u1q3b9773vdCNAMD7ZIQOAAAAgJZh/PjxkUik\noqIidAhAs3P//fcXFhYmk8kf/ehHAwcO7NChw+rVq5uampqamoYMGZKVlRU6EAB4H28QAgAA\nwId78MEHH3nkkW9961tnn3126BaAZufYY4999NFHq6qqLr744o0bN65evbpXr17Tp0+/9NJL\nq6urq6urQwcCAO/jDUIAAAD4EI2NjRMnTuzcuXMikQjdAtBMtWvXLhqNRqPR/3nxuuuuO/fc\nc7/73e8OGjSoX79+odoAgL/jDUIAAAD4EMlkcsOGDbfccsspp5wSugWgJcnOzn7ggQf27ds3\nfPjwXbt2hc4BAP7KQAgAAAD/mz//+c/Tpk3r0aNHLBYL3QLQ8lx00UWzZs2qr68vKipqamoK\nnQMARCIGQgAAAPjf3Xbbbbt27Zo9e3bHjh1DtwC0SLFYbNSoUQ8//PDcuXNDtwAAkYiBEAAA\nAP4X69at+/GPf3zxxRdfeeWVoVsAWrC77767X79+kyZNevzxx0O3AAAGQgAAAPjHxowZc/Dg\nwYqKirS0tNAtAC1YZmbmokWLMjMzr7766m3btoXOAYC2zkAIAAAAH6y2tvY3v/nNv/7rv553\n3nmhWwBavLy8vKqqqh07dowYMaKxsTF0DgC0aQZCAAAA+AD79u0rLi7Oysq6/fbbQ7cAtBLD\nhg0bN27csmXLJk6cGLoFANo0AyEAAAB8gB/+8Id1dXWTJ08+9dRTQ7cAtB4zZswYMmRIRUVF\ndXV16BYAaLsMhAAAAPD3du7cOW3atNNPPz0ej4duAWhVMjIy5s+f37Vr1xtvvHHt2rWhcwCg\njTIQAgAAwN+77bbbXnvttTlz5nTq1Cl0C0Brk52d/cADDzQ2Ng4fPnzXrl2hcwCgLTIQAgAA\nwPu88MIL99xzz+DBg0eMGBG6BaB1uuiii2bNmlVfX19UVNTU1BQ6BwDaHAMhAAAAvM/YsWP3\n799fUVGRlpYWugWg1YrFYqNGjXr44Yfnzp0bugUA2hwDIQAAAPzNkiVLfv3rX0ej0QsuuCB0\nC0Ard/fdd/fr12/SpEmPP/546BYAaFsMhAAAAPBX+/fvnzBhwtFHH3377beHbgFo/TIzMxct\nWpSZmXn11Vdv27YtdA4AtCEGQgAAAPiru+++e82aNZMmTTr99NNDtwC0CXl5eVVVVTt27Bgx\nYkRjY2PoHABoKwyEAAAAEIlEIjt37pw6depnPvOZcePGhW4BaEOGDRs2duzYZcuWTZw4MXQL\nALQVBkIAAACIRCKRqVOn/uUvfykrK8vMzAzdAtC2zJw5c8iQIRUVFdXV1aFbAKBNMBACAABA\n5MUXX7zrrrsuvPDCr3/966FbANqcjIyM+fPnd+3a9cYbb1y7dm3oHABo/QyEAAAAEBkzZsy+\nffvmzJmTlpYWugWgLcrOzl64cGFjY+Pw4cN3794dOgcAWjkDIQAAAG3d7373u//6r//6xje+\nkZ+fH7oFoO0aPHjwrFmz6uvro9FoU1NT6BwAaM0MhAAAALRpBw4ciMfjRx999LRp00K3ALR1\nsVhs1KhRDz/8cHl5eegWAGjNDIQAAAC0affee+/q1auLi4tzcnJCtwAQufvuu/v16zdx4sTH\nH388dAsAtFoGQgAAANquN998s7S0tGvXrhMmTAjdAkAkEolkZmYuWrQoMzPz6quv3rZtW+gc\nAGidDIQAAAC0XVOnTn311VenT5+emZkZugWglThwIPKb30QOHPjkT8jLy6uqqtqxY8eIESMa\nGxsPXRoA8FcGQgAAANqoTZs2/eAHPxg4cOC1114bugWg9ViyJHL55ZElSz7VQ4YNGzZ27Nhl\ny5ZNnDjxEHUBAH9jIAQAAKCNGjdu3LvvvptMJtPTnY4BDpk9e/729dOYOXPmkCFDKioqqqur\nP30VAPA/OQIBAADQFj322GMPPfTQ1Vdf/bnPfS50CwAfICMjY/78+V27dr3xxhvXrl0bOgcA\nWhUDIQAAAG3OwYMHx48ff9RRR82cOTN0CwD/UHZ29sKFCxsbG4cPH7579+7QOQDQehgIAQAA\naHPmzZu3cuXKsWPH5ubmhm4B4H8zePDgsrKy+vr6aDTa1NQUOgcAWgkDIQAAAG3Lm2++WVJS\nkp2dPXHixNAtAHy4eDw+atSohx9+uLy8PHQLALQSBkIAAADalunTp7/yyivTp0/v0qVL6BYA\nPpK77rqrX79+EydOfPzxx0O3AEBrYCAEAACgDdm8eXNFRcWAAQOKiopCtwDwUWVlZS1atCgz\nM/Pqq6/etm1b6BwAaPEMhAAAALQhEyZM2Lt37+zZs9u1axe6BYCPIS8vr6qqaseOHSNGjGhs\nbAydAwAtm4EQAACAtuKpp5765S9/+dWvfvULX/hC6BYAPrZhw4aNHTt22bJlkyZNCt0CAC2b\ngRAAAIA24eDBg/F4vH379jNmzAjdAsAnNHPmzCFDhpSXl1dXV4duAYAWzEAIAABAm1BVVfXM\nM8/E4/EzzjgjdAsAn1BGRsb8+fO7du164403rl27NnQOALRUBkIAAABav7feeuuWW245+eST\np0yZEroFgE8lOzt74cKFjY2Nw4cP3717d+gcAGiRDIQAAAC0fmVlZdu3b7/99tuPOeaY0C0A\nfFqDBw8uKyurr6+PRqNNTU2hcwCg5TEQAgAA0Mq9/PLLc+fO7du373XXXRe6BYBDIx6Pjxo1\n6uGHHy4vLw/dAgAtj4EQAACAVq64uPidd94pLy/PyMgI3QLAIXPXXXf169dv4sSJjz/+eOgW\nAGhhDIQAAAC0Zk8//fT8+fOHDRt22WWXhW4B4FDKyspatGhRp06drr766m3btoXOAYCWxEAI\nAABAq9XU1BSLxTIyMmbNmhW6BYBDLy8vL5VK7dixY8SIEY2NjaFzAKDFMBACAADQav30pz9d\nsWLF97///by8vNAtABwWw4YNGzNmzLJlyyZNmhS6BQBaDAMhAAAArdOePXtuueWW448//uab\nbw7dAsBhVFZWNmTIkPLy8gULFoRuAYCWwUAIAABA61RWVrZ169bbb7/9+OOPD90CwGGUkZEx\nf/78rl27Xn/99WvXrg2dAwAtgIEQAACAVmjbtm1z5szp06fPDTfcELoFgMMuOzt74cKFjY2N\nw4cP3717d+gcAGjuDIQAAAC0QpMmTXr77bfnzp2bkZERugWAI2Hw4MFlZWX19fVFRUVNTU2h\ncwCgWTMQAgAA0NqsWrXq/vvv/8pXvvKlL30pdAsAR048Hh81atRDDz1UXl4eugUAmjUDIQAA\nAK1KU1NTLBZLT08vKysL3QLAkXbXXXf169dv4sSJjz/+eOgWAGi+DIQAAAC0Kr/4xS9+//vf\n33jjjf369QvdAsCRlpWVtWjRok6dOl199dXbtm0LnQMAzZSBEAAAgNZj7969kydPPu644267\n7bbQLQCEkZeXl0qlduzYMWLEiMbGxtA5ANAcGQgBAABoPebMmdPQ0JBIJE444YTQLQAEM2zY\nsDFjxixbtmzSpEmhWwCgOTIQAgAA0Eq8+uqrs2fPPvPMM7/73e+GbgEgsLKysiFDhpSXly9Y\nsCB0CwA0OwZCAAAAWolJkybt3r37zjvvbN++fegWAALLyMiYP39+165dr7/++rVr14bOAYDm\nxUAIAABAa/Dcc8+lUqnPf/7zX/nKV0K3ANAsZGdnL1y4sLGxcfjw4bt37w6dAwDNiIEQAACA\n1iAej6elpZWXl4cOAaAZGTx48MyZM+vr64uKipqamkLnAEBzYSAEAACgxVu4cOETTzzxb//2\nb/379w/dAkDzMmbMmFGjRj300EMVFRWhWwCguTAQAgAA0LI1NjZOmTLl2GOPLS0tDd0CQHN0\n11139evXb8KECU888UToFgBoFgyEAAAAtGxz58598cUXb7311hNPPDF0CwDNUVZW1qJFizp1\n6jRy5Mjt27eHzgGA8AyEAAAAtGA7duyYOXNmz549b7rpptAtADRfeXl5qVRqx44dV111VWNj\nY+gcAAjMQAgAAEALdvPNN+/atevOO+/s2LFj6BYAmrVhw4aNGTNm2bJlkyZNCt0CAIEZCAEA\nAGipnn/++fvuu+/SSy8dNmxY6BYAWoCysrIhQ4aUl5cvWLAgdAsAhGQgBAAAoKUqLi5uamqa\nM2dO6BAAWoaMjIz58+d37dr1+uuvX7t2begcAAjGQAgAAECL9OCDD/72t7/91re+NWjQoNAt\nALQY2dnZCxcubGxsHD58+O7du0PnAEAYBkIAAABansbGxokTJ3bu3Lm0tDR0CwAtzODBg2fO\nnFlfX19UVNTU1BQ6BwACMBACAADQ8lRWVm7YsOGWW2455ZRTQrcA0PKMGTNm5MiRDz30UEVF\nRegWAAjAQAgAAEAL8+c//3natGndu3ePxWKhWwBoqebNm9e3b98JEyY88cQToVsA4EgzEAIA\nANDC3HbbbW+88cbs2bM7duwYugWAliorK+vBBx/s1KnTyJEjt2/fHjoHAI4oAyEAAAAtybp1\n63784x9ffPHFw4cPD90CQMuWl5dXVVW1Y8eOq666qrGxMXQOABw5BkIAAABakrFjxx48eLCi\noiItLS10CwAt3hVXXDFmzJhly5ZNnjw5dAsAHDkGQgAAAFqM2tra//7v//7mN7953nnnhW4B\noJUoKysbMmTI3LlzFyxYELoFAI4QAyEAAAAtw759+4qLi7Oysu64447QLQC0HhkZGfPnz+/a\ntev111+/bt260DkAcCQYCAEAAGgZ/v3f/72urm7y5Mmnnnpq6BYAWpXs7OyFCxc2NjYOHz58\n9+7doXMA4LAzEAIAANAC7Ny584477jj99NPj8XjoFgBaocGDB8+cObOurq6oqKipqSl0DgAc\nXgZCAAAAWoDbbrvttddemz17dqdOnUK3ANA6jRkzZuTIkQ899FBFRUXoFgA4vAyEAAAANHfr\n16+/5557Bg8ePHLkyNAtALRm8+bN69u374QJE5544onQLQBwGBkIAQAAaO7Gjh27f//+ioqK\ntLS00C0AtGZZWVkPPvhgp06dRo4cuX379tA5AHC4GAgBAABo1h555JElS5aMGjXqggsuCN0C\nQOuXl5dXVVW1Y8eOq666qrGxMXQOABwWBkIAAACar/37948ZM+boo4++/fbbQ7cA0FZcccUV\n8Xh82bJlkydPDt0CAIeFgRAAAIDm6z/+4z/WrFkzadKkbt26hW4BoA2ZNWvWJZdcMnfu3AUL\nFoRuAYBDz0AIAABAM7Vz587S0tKuXbuOGzcudAsAbUtGRsaCBQtOO+2066+/ft26daFzAOAQ\nMxACAADQTE2dOvUvf/lLWVlZZmZm6BYA2pzs7OwHHnigsbFx+PDhu3fvDp0DAIeSgRAAAIDm\naOPGjXfdddeFF174jW98I3QLAG3U4MGDZ8yYUVdXV1RU1NTUFDoHAA4ZAyEAAADN0ZgxY/bt\n2zdnzpy0tLTQLQC0XWPHjh05cuRDDz2UTCZDtwDAIWMgBAAAoNn53e9+V1tb+/Wvfz0/Pz90\nCwBt3bx58/r27VtcXPzEE0+EbgGAQ8NACAAAQPNy4MCBeDx+9NFHT58+PXQLAESysrIefPDB\nTp06jRw5cvv27aFzAOAQMBACAADQvPzoRz9avXp1cXFxTk5O6BYAiEQikby8vKqqqh07dlx1\n1VWNjY2hcwDg0zIQAgAA0Iy8+eabpaWlp5122oQJE0K3AMDfXHHFFfF4fNmyZZMnTw7dAgCf\nloEQAACAZmTq1Kl/+tOfpk+fnpmZGboFAN5n1qxZl1xyydy5cxcsWBC6BQA+FQMhAAAAzcWm\nTZt+8IMfDBw4cNSoUaFbAODvZWRkLFiw4LTTTrv++uvXrVsXOgcAPjkDIQAAAM3F+PHj3333\n3WQymZ7uuApAc5Sdnf3AAw80NjYOHz589+7doXMA4BNy4gIAAKBZeOyxxx588MGRI0d+7nOf\nC90CAP/Q4MGDZ8yYUVdXV1RU1NTUFDoHAD4JAyEAAADhHTx4cPz48R07dpw+fXroFgD4EGPH\njh05cuRDDz2UTCZDtwDAJ5EROgAAAAAi//mf/7ly5copU6b07NkzdAt/9fDDkVdf/Uh3rlwZ\niUQijzwS2bnzI92flha58srIiSd+8jaA4ObNm7dmzZri4uJBgwZdcskloXMA4OMxEAIAABDY\nm2++edttt5188skTJ04M3cJf7dwZGT48cvDgx/gv99778Z4/YcLHjQJoRrKyshYtWnTBBReM\nHDly1apVp512WugiAPgYDIQAAAAENn369FdeeeXHP/5xly5dQrfwV8cdF1m5MvKXv3ykmw8e\njDz3XGTgwEj6R/tLJmlpkc9+9tPUATQLZ555ZlVV1fDhw0eMGPHYY4+1b98+dBEAfFQGQgAA\nAELavHlzRUXFgAEDvvnNb4Zu4X0GDPgYN1922WHrAGjGrrjiing8Xl5ePnny5Dlz5oTOAYCP\n6qP9ah8AAAAcHhMnTty7d+/s2bPbtWsXugUAPrZZs2Zdcsklc+fOXbBgQegWAPioDIQAAAAE\n89RTTz3wwAPDhw//whe+ELoFAD6JjIyMBQsWnHrqqddff/26detC5wDAR2IgBAAAIIyDBw/G\n4/H27dvPnDkzdAsAfHLZ2dkPPPBAY2Pj8OHDd+/eHToHAD5cy/wbhE2N9av/UFe/6bXdb+1p\nPNDhqMyTu+b06XtOr67+mj0AAECLkUqlnnnmmQkTJpxxxhmhWwDgUxk8ePCMGTPGjRv37W9/\ne/78+aFzAOBDtLCB8MC7L/1H4ubyHy3c+Nrev/tWWlpa7sDP3zShdNzVnw3SBgAAwEf31ltv\n3XzzzSeddNKUKVNCtwDAITB27Njly5cvWLBg8ODB8Xg8dA4A/G9a0kB4YO/mK/sPrH1x1wl9\nP/v1wgFH79n25JIldbsav/C9KRcetXv96mf/z//53fivPTL/tz9c8eObQscCAADwvykrK9u+\nfft//Md/HHPMMaFbAODQmDdv3po1a4qLiwcNGnTJJZeEzgGAf6glDYRLv/fl2hd3XTXr4fvH\nF7ZPi0Qikf3vbBo75KIf3f/7n7zyaNcO6e++Xjf9O8OmzvveNZcN/dnI7qF7AQAA+GAvv/zy\n3Llz+/bte/3114duAYBDJisra9GiRRdccMHIkSNXrVp12mmnhS4CgA/WkgbC2x7Y0vn02MLi\nwv93JaNTj+kPT/tB1xuuq2n476u6dzz+zMQvVj7zf06qHVcRGZn8KM88cODAr371q717//4D\nS/+nLVu2RCKRgwcPfrp8AAAA/mrChAnvvPNOeXl5RkZLOpYCwIc688wzq6qqhg8fPmLEiMce\ne6x9+/ahiwDgA7Skk9gf3tp3fH7B313MzP56JHLDpl++FLmqeyQSSUvPHH3W8b9Z9vNI5CMN\nhI8++mhhYeGH3xeJbN68+eMGAwAA8P97+umnf/GLXxQWFl522WWhWwDg0LviiitisVhFRcXk\nyZPnzJkTOgcAPkBLGggv6NzhmdW/ikQ+/z8v7t25JBKJHHXKUf/vyrKGt9Lbn/IRn3nppZfW\n1NT8728Q3nXXXY899lj37j6zFAAA4NNqamoaP358RkbG7NmzQ7cAwOEye/bsVatWzZ0798IL\nLxwxYkToHAD4ey1pICz5Ro9L7po7cvbnfjr+ig5pkUgkcrDxlZKvxiKRSOG/nRGJRJoOvr0k\n+f2pDbs+88V//4jPbNeuXUHB37+V+Hd+9atfRSKR9PT0TxMPAABAJBL52c9+9uSTT44dOzYv\nLy90CwAcLhkZGQsWLBg0aNB1113Xr1+/vn37hi4CgPdpSaPX4DsfvvzUzIUTrsw+87xhX4te\n9S9fOOPk3NlPvPKZy6dN631cJBL55fk9vjL2vo7Hnnv//KtCxwIAAPD39uzZc/PNNx9//PE3\n33xz6BYAOLyys7MfeOCBxsbG4cOH7969O3QOALxPSxoIM47qVVu3YsI1/7R/03M186t/ufj/\nNOztfFUsuWbx5Pdu6HhC3sibSp/Z9OTnjusYNhUAAID/X1lZ2datW6dOnXr88ceHbgGAw27w\n4MEzZsyoq6u74YYbQrcAwPu0pI8YjUQi7Tv3Lfvpo9Pu3fFC3ZZ30zPP6NvnmPZ/2zgLfrP0\nQz4tFAAAgEC2bds2Z86cPn36+CEpAG3H2LFjly9fPn/+/Isuuigej4fOAYC/amED4XsyOp3c\nf+DJoSsAAAD4GCZPnvz222/PnTu3ffv2oVsA4MiZN2/emjVriouLBw0adMkll4TOAYBIpGV9\nxCgAAAAt1KpVq372s58NHTr0S1/6UugWADiisv4ve3ceXXV94P//XsxFUOIyogTXupWl0lZt\nncpigbFONzslSkigC9CSEQQSIGEJhC2QAEkgQHEhLdCFJAQM007rd6wVtIBWW20rsthKa4sK\nFVeQRDCB3x/jmf7aoxgw8M699/H4I+dw8z6f8/yLcz553fu5HTrU1dWdccYZGRkZL730Uugc\nAIhEDIQAAACcbEePHs3JyWnTps2CBQtCtwBAAF26dPn+97//8ssvDxw48J133gmdAwDHHAh3\n7dr1/O63TlkKAAAACWnNmjWbN28eNWrUxz72sdAtABDGV7/61ZycnEcffXTKlCmhWwDgmAPh\nVVdd9albfnrKUgAAAEg8b7/99pQpU84999zp06eHbgGAkEpLS2+66aaFCxeuXbs2dAsAyc4j\nRgEAADiJysrKnn/++RkzZpx33nmhWwAgpJSUlNra2s6dOw8fPnz79u2hcwBIagZCAAAATpa/\n/e1vpaWlXbp0GTVqVOgWAAivU6dOa9euPXToUHp6+v79+0PnAJC8DIQAAACcLFOmTNm/f395\neXksFgvdAgCtQs+ePUtKSp599tns7OzQLQAkr5Rj//qd+u2PPPJIcy702c9+tiV6AAAASBC/\n/e1vv//97/fv3/9LX/pS6BYAaEXGjx//xBNPrFmz5sYbb8zJyQmdA0Ay+oCBcP9fi/r2LWrO\nhY4ePdoSPQAAACSI3NzcaDRaUVEROgQAWpdoNPq9733vmWf73DbAAAAgAElEQVSeycvLu+66\n6/r06RO6CICk8wED4eln3Tjgi5edmhQAAAASxrp16375y1+OGjWqR48eoVsAoNXp0KFDXV3d\nDTfckJGR8eSTT1544YWhiwBILh8wEHa4cGx1deapSQEAACAxHD58eMqUKWedddb06dNDtwBA\nK9WlS5fKyspBgwYNHDjw4Ycf9n29AJxKbUIHAAAAkGgWLlz43HPPTZ8+vVOnTqFbAKD1ysjI\nyM3NffTRRwsKCkK3AJBcDIQAAAC0pJdffnnevHlXXnnl6NGjQ7cAQGtXWlp60003lZeXr127\nNnQLAEnEQAgAAEBLmjZt2ptvvlleXn766aeHbgGA1i4lJaW2trZz587Dhw/fvn176BwAksWx\nBsLRo0d/e8jVpywFAACAePf73/9+xYoV/fr1+4//+I/QLQAQHzp16rR27dpDhw6lp6fv378/\ndA4ASSHlGL9bunRpJHLkqZ/9aP1Dj7/0esPZna+8ZdC3P/+J809ZHAAAAPElPz//6NGjpaWl\noUMAIJ707NmzpKQkLy8vOzu7pqYmdA4Aie9YA+HRIwcnfunjZf/zp/97pWLe9G8s/OWq3BtP\nfhgAAABx5r/+678efPDB7Ozs66+/PnQLAMSZ8ePHP/7442vWrLnxxhtzcnJC5wCQ4I71iNFn\nyj9f9j9/Sml36ZhpxZXLl0wY/m9tIk0/mPDZyt0HTlkfAAAAceHw4cOTJk1KTU2dNWtW6BYA\niD/RaHTFihXdu3fPy8vbtGlT6BwAEtyxBsLS8t9G28Qqt29dUjTl2yPGlH3vF5tn/evRI++U\nz3z6lPUBAAAQF5YsWfKHP/xh6tSpaWlpoVsAIC516NChrq7ujDPOyMjIeOmll0LnAJDIjjUQ\n/uy1htSL8oZeftb/vXL9+OWRSOTVx/ec9C4AAADix759++bOnXv55Zd7JBoAfBhdunRZvnz5\n3r17Bw4c+M4774TOASBhHWsgfO2dI7Ezr/n/v/K//zza1HhyowAAAIgrM2bMeOONN0pLS9u1\naxe6BQDi26BBg3Jzcx999NGCgoLQLQAkrGMNhO91IHqyQgAAAIhP27dvr6ys7NmzZ3p6eugW\nAEgEpaWlN910U3l5+dq1a0O3AJCYPnAgBAAAgGMZP378kSNHFi9eHI16UykAtICUlJTa2trO\nnTsPHz58+/btoXMASEAGQgAAAE7cT3/60wceeGDo0KGf+tSnQrcAQOLo1KnT2rVrDx06lJ6e\nvn///tA5ACSalGP/ev9fZ/bps6w5L27atKkluwAAAGj1GhsbJ0+e3KFDhzlz5oRuAYBE07Nn\nz5KSkry8vOzs7JqamtA5ACSUDxgI36l/dvPmZ5vzIgAAAMnmO9/5zrZt2+bMmdO5c+fQLQCQ\ngMaPH//444+vWbPmxhtvzMnJCZ0DQOI41kD43HPPnbIOAAAA4svrr78+Z86cSy65ZNy4caFb\nACAxRaPRFStWbNu2LS8v77rrruvTp0/oIgASxAd8gvC0tp0+ckmHU5MCAABAHJkxY8arr766\nbNmyM844I3QLACSsDh061NXV3XDDDRkZGU8++eSFF14YugiARNDmGL+76qqrPnXLT09ZCgAA\nAPFi586d99xzz4033piRkRG6BQASXJcuXZYvX753796BAwe+8847oXMASATHGggBAADgPY0f\nP76xsbGioiIajYZuAYDEN2jQoJycnEcffbSgoCB0CwCJwEAIAADA8XnooYf+3//7f1//+tdv\nuOGG0C0AkCzKysr69OlTXl6+du3a0C0AxD0DIQAAAMehqakpNze3ffv2RUVFoVsAIImkpKTU\n1tZ27tx5+PDh27dvD50DQHxLOfav36nf/sgjjzTnQp/97GdbogcAAIBW7e67737mmWdmzpx5\n6aWXhm4BgOSSlpa2du3avn37pqenP/HEE2eddVboIgDi1QcMhPv/WtS3b7PeE3r06NGW6AEA\nAKD1euONN2bNmnXRRRfl5eWFbgGAZNSzZ8/i4uL8/Pzs7OyamprQOQDEqw8YCE8/68YBX7zs\n1KQAAADQys2ePfuVV1750Y9+dOaZZ4ZuAYAkNWHChCeeeGLNmjU9e/YcO3Zs6BwA4tIHDIQd\nLhxbXZ15alIAAABozXbt2nXXXXf967/+6+DBg0O3AEDyikajK1as2LZtW15e3rXXXtunT5/Q\nRQDEnzahAwAAAIgP48aNO3z4cFlZWTQaDd0CAEmtQ4cOdXV17du3z8jIeOmll0LnABB/DIQA\nAAB8sA0bNvz3f/93VlZW7969Q7cAAJEuXbosX7587969AwcOfOedd0LnABBnDIQAAAB8gKam\npnHjxrVv3764uDh0CwDwrkGDBuXk5Dz66KMFBQWhWwCIM8f6DsLRo0ef2enqU5YCAABA61RZ\nWfn0008XFhZedtlloVsAgL8rKyt76qmnysvLb7jhhoEDB4bOASBuHGsgXLp06SnrAAAAoHU6\ncODArFmzOnXqlJ+fH7oFAPgHKSkptbW1119//fDhwz/2sY917949dBEA8cEjRgEAADiWoqKi\nvXv3zp8/PzU1NXQLAPDP0tLS1q5de+jQofT09P3794fOASA+GAgBAAB4X3/605+WLFly7bXX\n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\n/fXXh24BACCOxWKxmpqajh07Dh06dOfOnaFzAI7FQAgAACSvw4cPT5w4MTU1dfbs2aFbAACI\nexdffPGaNWvq6+szMjLq6+tD5wC8LwMhAACQvL7zne/84Q9/KCgo6Ny5c+gWAAASQb9+/YqK\nirZu3TpixIjQLQDvy0AIAAAkqddee23u3LmXX355bm5u6BYAABLH5MmT09PTq6qq7r777tAt\nAO/NQAgAACSpwsLC1157bf78+e3atQvdAgBA4ohGo6tWreratWtOTs6WLVtC5wC8BwMhAACQ\njHbs2LF8+fKePXvefvvtoVsAAEg0qamptbW1sVgsKytr3759oXMA/pmBEAAASEbjx48/cuRI\nRUVFNBoN3QIAQALq0aNHZWXl7t27MzMzm5qaQucA/AMDIQAAkHR+9rOf/c///M83vvGNT3/6\n06FbAABIWIMHDx45cuSGDRumT58eugXgHxgIAQCA5NLY2Dhp0qQOHTrMnTs3dAsAAAlu8eLF\nvXr1KikpqaurC90C8HcGQgAAILncdddd27ZtmzRp0oUXXhi6BQCABBeLxaqrqzt27Dh06NCd\nO3eGzgF4l4EQAABIIq+//vrs2bMvvvji8ePHh24BACApXHLJJTU1NfX19RkZGfX19aFzACIR\nAyEAAJBUZs6c+eqrry5YsOCMM84I3QIAQLLo37//7Nmzt27dOmLEiNAtAJGIgRAAAEgezz77\n7N133/2Zz3wmMzMzdAsAAMllypQp6enpVVVV99xzT+gWAAMhAACQNCZMmNDY2FhWVhaNRkO3\nAACQXKLR6KpVq7p27Tp27NgtW7aEzgGSnYEQAABICg899NDPfvazIUOG9OrVK3QLAADJKDU1\ntba2NhaLZWVl7du3L3QOkNQMhAAAQOJramoaN25c+/bt586dG7oFAIDk1aNHj8rKyt27d2dm\nZjY1NYXOAZKXgRAAAEh8995779atWydOnHjppZeGbgEAIKkNHjx45MiRGzZsmD59eugWIHkZ\nCAEAgAT3xhtvzJgx46KLLsrPzw/dAgAAkcWLF/fq1aukpKSuri50C5CkDIQAAECCKyoqeuWV\nV0pKSs4888zQLQAAEInFYtXV1R07dvzWt7713HPPhc4BkpGBEAAASGS7du1atmzZddddN2TI\nkNAtAADwrksuuaSmpubAgQPp6en19fWhc4CkYyAEAAAS2YQJEw4dOrR48eI2bdz+AADQivTv\n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\nrl3bt2+Poqi8vLywsDBx2NatW0tKSqIo+uijj4qKiqIoKi0t3bJlS938aPu807GKIbPy2yVr\nUkOhAVm3bt17773XpEmTDh06HHrooXGPAzQk//jHP6ZOndqpU6eqvMwIAACoJ4444ojZs2f3\n69dvwIABS5YsyT6gNyEH6jGBENhTly5dsrKyHn/88WuvvTaKoiZNmpxzzjmJp8rKyn71q181\na9bsnnvuSRSvWldUVFRcXLzH55V8UpNn9z7ss88+Sz64Y8eOOnurxWRfrPj53p9U/mytnCRS\nLvkCzz///OjRo1esWJH4MiUlpU+fPvfee+/xxx8f72BAQzFixIji4uL77rsv8eoZAACgoejT\np8/48ePHjh172WWXzZo1K+5xgNohEAJ7ysnJueyyy+6///6xY8dOmDAhsV1nFEVlZWUjR458\n8803R40adZDqYBRF2dnZ9bBU1WKDPKBnN23atMdhmzdvLisrq5uf+iA1yGqcxBtbxm769OlX\nX311Tk7OFVdc0alTp127dv3pT3/6/e9/f+qppy5cuLB79+5xDwjUd6+99tq8efMGDBhw+umn\nxz0LAABwwG6++ebly5fPnj27V69el19+edzjALXA71uBfZg8efKf//zniRMnLliw4IILLigo\nKFi/fv3cuXNXrFjRo0eP2267Le4B61oyW9bnZrnPB2v3nst9Prht27bdu3fXzU9dlzdTVn5Y\nctvYEKxateq666479thjFy5cWFBQkHjw6quvfu211/r16zdw4MB3333X23wClSgrK7vuuuvS\n09Nvv/32uGcBAACqIyUlZebMmStXrrz22ms7derUpUuXuCcCakogBPYhJydn8eLFY8eOffDB\nB0eNGpV4sFmzZqNHj77tttuysrLiHY+ofjfLlbARpwAAIABJREFUqM7vudzjVsuKh9WBOtj3\ntYp/RPJtL2vXtGnTSkpKZs2alayDCd26dbv99tuvuuqqJ554wjuKAZV45JFH3njjjVGjRn35\ny1+OexYAAKCacnNz582b17Vr1/79+y9fvjw/Pz/uiYAaEQiBfWvatOk999wzceLEZcuWbdiw\noU2bNqeccko4t0xRDfVte9hdu3Zt3749iqLy8vLCwsLEg1u3bi0pKYkqRMSSkpKtW7cmni0s\nLCwvL4+iaPv27bt27drvSYqLi4uKiqIoKi0t3bJlS+LZzZs3FxcXFxcXJ9/Gcvfu3du2baub\nnzotLa158+aJz5O9MHm/Y3p6ek5OTuLZ5P9HOTk56enpURRlZmY2bdo0iqLU1NQWLVoknm3e\nvPmzzz7bpk2bVatWrVmzJoqiJk2aNGvWLC8vLzc398wzz4yi6OWXXxYIgS+ybdu2W265pXXr\n1mPGjIl7FgAAoEY6duz4i1/84kc/+tHFF188f/587y8ODZpACFQmOzu7R48ecU8B1ZGRkZGR\nkZH4vGXLlvEOk5S42TGqsDXrzp07d+zYEUVRWVnZ5s2bE89u2bKltLQ0qr2Qmfhz9wiZB/R+\nlpdccskXPfWb3/xm0aJFLVq0yM3Nzc3NTXyS+JiXl1fxy8THZEgGQnDHHXd89NFHDz74YPLl\nCwAAQMP1wx/+8PXXX58xY8a4ceMmTJgQ9zhA9QmEAFB3kvft1YebLBP2eadjxZA5ZMiQ1NTU\nBx54IHm75ObNmwsLCzdt2rRhw4aZM2e2bdv2iCOO2Lx587p16woLCxO9sxIZGRkVk2HiZsS9\nO2LyY/J2RqDBWb9+/b333tuxY8dLL7007lkAAIDaMW3atDfffHPSpElf//rXv/Od78Q9DlBN\nAiEABK1p06aJnUWjKGrduvXeB5x55pkPP/zw0Ucf3aFDhz2eeuihh2bOnHnbbbdddtllFR9P\nvDHkPiX2ZU1++cEHH2zYsCFxp2MlsrKy8v5/2dnZez+YkJ+fn7x5FIjXqFGjioqK7r777rS0\ntLhnAQAAakdmZuZTTz3VuXPnIUOGLF26tH379nFPBFSHQAgAVObqq69+5JFHLr744kWLFh16\n6KHJx996661Ro0a1adPmwgsv3ONbEm9I+aUvfamKf8TeQXGPjpi0du3ajRs3Jm55rESyHVbS\nESu2xvpzQyc0Jq+//vrvfve7c889N/F+pQAAQKNRUFAwd+7cvn37nnfeea+//nrylcdAAyIQ\nAgCV6dSp0+TJk0ePHn388ccPHTq0U6dOu3fvXrx48ezZs8vLy5977rmav69Y9YLiF0XEPRQV\nFX388ceJd22sRFU6YvKYNm3auB0KKldeXj58+PD09PQ777wz7lkAAIDa17t373Hjxo0dO3bY\nsGGPPfZY3OMAB0wgBAD2Y9SoUcccc8xNN9101113JR/s1q3btGnTTjnllLqfJxEUD+hbKk+J\nFVvj2rVrP/3009LS0spPuM+g+EU3LB566KHp6ek1+Imh4Xnsscf++te/3nDDDV/5ylfingUA\nADgobr755uXLl8+aNatXr157vPkIUP8JhADA/p1//vn9+/d/++2333vvvfT09BNOOOGYY46J\ne6gDcFB3Pf3888937dpV+QkrhsP9bnzasmXLrKysGv/QEJuioqKxY8e2bNlyzJgxcc8CAAAc\nLCkpKTNnzly5cuU111xz8sknd+nSJe6JgAMgEAIAVZKamnrSSSeddNJJcQ9SF6odFPe78ena\ntWuLi4s3bdq033Pud9fTiq2xbdu2qampNfuhodbccccd//znP6dPn96yZcu4ZwEAAA6i3Nzc\nefPmde3atX///suXL8/Pz497IqCqBEIAgJo60KAY7W/X04qtsSa7nn7RDYt2PeXg+de//nXP\nPfccd9xxthgCAIAQdOzYccaMGRdffPHAgQMXLlyYlpYW90RAlQiEAAAxqPmup190w+LatWs/\n++yz3bt3V37CA9r1tFWrVpmZmTX+oQnCqFGjtm/fft999zVp4t8aAAAQhMGDB7/88sszZswY\nP378hAkT4h4HqBL/aAcAaABqEhQr3/h07dq1iWMqP2FWVtZ+O6JdT/nLX/7y29/+9uyzz+7b\nt2/cswAAAHVn2rRpb7755sSJEzt37nzuuefGPQ6wfwIhAEAjdDB2PU22xrVr137yySdlZWWV\nn7CSmrh3a2zdurUbzhq68vLyG2+8MS0t7Y477oh7FgAAoE5lZmY+9dRTnTt3Hjp06Iknnti+\nffu4JwL2w29hAACIolra9XSfNyxWY9fT/W58atfTemjOnDmvvvrqdddd16FDh7hnAQAA6lpB\nQcHcuXP79u173nnnvf76602bNo17IqAyAiEAANVxUHc93bhx486dOys/YSIfVn3j03bt2qWk\npNT452bfioqKxowZk5eXN3bs2LhnAQAA4tG7d+/bbrvt1ltvHTZs2GOPPRb3OEBlBEIAAOpC\nNYJi5R2xdnc93bs12vX0gNx9993r16+fNm1aq1at4p4FAACIzS233LJ8+fJZs2YdffTRH3zw\nweLFiwsLC1u0aNGrV69rrrnma1/7WtwDAv/mVx4AANRHiaCYl5dX811P975nce3atRs2bCgp\nKan8hHsHxUpuWMzPz8/IyKjxz90gffjhh3fdddexxx57xRVXxD0LAAAQp5SUlJkzZ77yyis/\n+9nPUlJSOnTo0L59+08//fSxxx6bNWvWxIkTb7rpprhnBKJIIAQAoNGo4dsoVnLD4gHtelr1\n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\nAAAAAAACIhACAAAAAABAQARCAAAAAAAACIhACAAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAE\nRCAEAAAAAACAgAiEAAAAAAAAEBCBEAAAAAAAAAIiEAIAAAAAAEBABEIAAAAAAAAIiEAIAAAA\nAAAAAREIAQAAAAAAICACIQAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAQEIEQAAAAAAAAAiIQ\nAgAAAAAAQEAEQgAAAAAAAAiIQAgAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABEQgBAAAAAAA\ngIAIhAAAAAAAABAQgRAAAAAAAAACIhACAAAAAABAQARCAAAAAAAACIhACAAAAAAAAAERCAEA\nAAAAACAgAiEAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAEBCBEAAAAAAAAAIiEAIAAAAAAEBA\nBEIAAAAAAAAIiEAIAAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAREIAQAAAAAAICACIQAAAAA\nAAAQEIEQAAAAAAAAAiIQAgAAAAAAQEAEQgAAAAAAAAiIQAgAAAAAAAABEQgBAAAAAAAgIAIh\nAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABAQgRAAAAAAAAACIhACAAAAAABAQARCAAAAAAAA\nCIhACAAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAEBCBEAAA\nAAAAAAIiEAIAAAAAAEBABEIAAAAAAAAIiEAIAAAAAAAAAREIAQAAAAAAICACIQAAAAAAAARE\nIAQAAAAAAICACIQAAAAAAAAQEIEQAAAAAAAAAiIQAgAAAAAAQEAEQgAAAAAAAAiIQAgAAAAA\nAAABEQgBAAAAAAAgIAIhAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABAQgRAAAAAAAAACIhAC\nAAAAAABAQARCAAAAAAAACIhACAAAAAAAAAERCAEAAAAAACAgAiEAAAAAAAAERCAEAAAAAACA\ngAiEAAAAAAAAEBCBEAAAAAAAAAIiEAIAAAAAAEBABEIAAAAAAAAIiEAIAAAAAAAAAREIAQAA\nAAAAICACIQAAAAAAAAREIAQAAAAAAICACIQAAAAAAAAQEIEQAAAAAAAAAiIQAgAAAAAAQEAE\nQgAAAAAAAAiIQAgAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAAABEQgBAAAAAAAgIAIhAAAAAAA\n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\nAAAAgBj5fwCVYnwNvrNhAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 720,
       "width": 1200
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "plotmeans(TPT~Tahun , main = \"Tahun X TPT\", data = data1)\n",
    "ggsave(\"output/eda_tahun x tpt.png\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d7ecb47f",
   "metadata": {
    "papermill": {
     "duration": 0.017148,
     "end_time": "2023-05-14T08:05:05.262584",
     "exception": false,
     "start_time": "2023-05-14T08:05:05.245436",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Sebaran Data Tiap Variabel"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "87e750b0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:05.299370Z",
     "iopub.status.busy": "2023-05-14T08:05:05.298160Z",
     "iopub.status.idle": "2023-05-14T08:05:06.554101Z",
     "shell.execute_reply": "2023-05-14T08:05:06.552026Z"
    },
    "papermill": {
     "duration": 1.276209,
     "end_time": "2023-05-14T08:05:06.556720",
     "exception": false,
     "start_time": "2023-05-14T08:05:05.280511",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Variabel</th><th scope=col>Nilai</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Stunting</td><td>24.9</td></tr>\n",
       "\t<tr><td>Stunting</td><td>27.5</td></tr>\n",
       "\t<tr><td>Stunting</td><td>13.6</td></tr>\n",
       "\t<tr><td>Stunting</td><td>25.0</td></tr>\n",
       "\t<tr><td>Stunting</td><td>23.6</td></tr>\n",
       "\t<tr><td>Stunting</td><td>27.2</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 2\n",
       "\\begin{tabular}{ll}\n",
       " Variabel & Nilai\\\\\n",
       " <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Stunting & 24.9\\\\\n",
       "\t Stunting & 27.5\\\\\n",
       "\t Stunting & 13.6\\\\\n",
       "\t Stunting & 25.0\\\\\n",
       "\t Stunting & 23.6\\\\\n",
       "\t Stunting & 27.2\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 2\n",
       "\n",
       "| Variabel &lt;chr&gt; | Nilai &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| Stunting | 24.9 |\n",
       "| Stunting | 27.5 |\n",
       "| Stunting | 13.6 |\n",
       "| Stunting | 25.0 |\n",
       "| Stunting | 23.6 |\n",
       "| Stunting | 27.2 |\n",
       "\n"
      ],
      "text/plain": [
       "  Variabel Nilai\n",
       "1 Stunting 24.9 \n",
       "2 Stunting 27.5 \n",
       "3 Stunting 13.6 \n",
       "4 Stunting 25.0 \n",
       "5 Stunting 23.6 \n",
       "6 Stunting 27.2 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\u001b[1m\u001b[22mSaving 12.5 x 6.67 in image\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nIhACAAAAAABAIAIhAAAAAAAABCIQAgAAAAAAQCACIQAAAAAAAAQiEAIAAAAAAEAgAiEAAAAA\nAAAEIhACAAAAAABAIAIhAAAAAAAABCIQAgAAAAAAQCACIQAAAAAAAAQiEAIAAAAAAEAgAiEA\nAAAAAAAEIhACAAAAAABAIAIhAAAAAAAABCIQAgAAAAAAQCACIQAAAAAAAAQiEAIAAAAAAEAg\nAiEAAAAAAAAEIhACAAAAAABAIAIhAAAAAAAABCIQAgAAAAAAQCACIQAAAAAAAAQiEAIAAAAA\nAEAgAiEAAAAAAAAEIhACAAAAAABAIAIhAAAAAAAABCIQAgAAAAAAQCACIQAAAAAAAAQiEAIA\nAAAAAEAgAiEAAAAAAAAEUl3qAQC7zOzZs++7776lS5d269Zt0KBBZ511VqdOnUo9CgAAAAAA\nyotACFSIn//851OmTMnn84VCIZ/Pz50794EHHrjzzjv333//Uk8DAAAAAIAy4hajQCWYMWPG\nlClTUkqFQmHrf999993x48eXdhgAAAAAAJQbgRCoBI8++mg+/9FfaIVC4aWXXlq+fHlJJgEA\nAAAAQHkSCIFKsHLlyizLdnaqyGMAAAAAAKCcCYRAJejSpUsul9vhqd13373IYwAAAAAAoJwJ\nhEAlGDp0aOvnDm4rn8/X1tb279+/JJMAAAAAAKA8CYRAJRgxYkS/fv22PZLP57Msu+KKK6qq\nqkq1CgAAAAAAypBACFSC9u3bT5w48Stf+Uq7du1aj+y///6/+MUvhg8fXtphAAAAAABQbnJZ\nlpV6Q7HNnz+/rq4upTRr1qwhQ4aUeg6wK7W0tKxYsaK2trZLly6l3gIAAAAAAOWoutQDAHal\nqqqq/fbbr9QrAAAAAACgfLnFKAAAAAAAAAQiEAIAAAAAAEAgAiEAAAAAAAAEIhACAAAAAABA\nIAIhAAAAAAAABCIQAgAAAAAAQCACIQAAAAAAAAQiEAIAAAAAAEAgAiEAAAAAAAAEIhACAAAA\nAABAIAIhAAAAAAAABCIQAgAAAAAAQCACIQAAAAAAAAQiEAIAAAAAAEAgAiEAAAAAAAAEIhAC\nAAAAAABAIAIhAAAAAAAABCIQAgAAAAAAQCACIQAAAAAAAAQiEAIAAAAAAEAgAiEAAAAAAAAE\nIhACAAAAAABAIAIhAAAAAAAABCIQAgAAAAAAQCACIQAAAAAAAAQiEAIAAAAAAEAgAiEAAAAA\n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\nYMGCnZ0SCAEAAKBSCYQAABDXqlWrdnZq3bp1xVwCAAAAFI1ACAAAcWVZVuoJAAAAQLEJhAAA\nEFf37t13dqpz587FXAIAAAAUjUAIAABx9erVa2en+vbtW8wlAAAAQNEIhAAAEFcul9vZqerq\n6mIuAQAAAIpGIAQAgLhWrVqVz+/4j4JFixYVeQwAAABQHAIhAADElc/nsyzb2akijwEAAACK\nw9/8AAAQV319/c4CYX19fZHHAAAAAMUhEAIAQFynnnrqnnvuuf3FgsOHD+/Vq1dJJgEAAABt\nTSAEAIC4ampqfvnLX9bV1W09ksvlTjvttGuvvbaEqwAAAIA2VV3qAQAAQCn16dPnt7/97dy5\ncxcvXtyxY8dDDz20T58+pR4FAAAAtCGBEAAAosvlcoMGDRo0aFCphwAAAADF4BajAAAAAAAA\nEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiEAAAA\nAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiE\nAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAA\ngQiEAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAA\nAAAAgQiEAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAI\nAAAAAAAAgQiEAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQ\niEAIAAAAAAAAgQiEAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAA\nAAAQiEAIAAAAAAAAgQiEAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQA\nAAAAAAAQiEAIAAAAAAAAgQiEAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACB\nCIQAAAAAAAAQiEAIAAAAAAAAgQiEAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAA\nAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiEAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgA\nAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiEAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCI\nQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiEAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAA\nABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiEAAAAAAAAEIhACAAAAAAAAIEIhAAA\nAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiEAAAAAAAAEIhACAAAAAAAAIEI\nhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiEAAAAAAAAEIhACAAAAAAA\nAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiEAAAAAAAAEIhACAAA\nAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiEAAAAAAAAEIhA\nCAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiEAAAAAAAA\nEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiEAAAA\nAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAAgQiE\nAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAAAAAA\ngQiEAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBCIQAAAAAAAAQiEAIAAAA\nAAAAgQiEAAAAAAAAEIhACAAAAAAAAIEIhAAAAAAAABCIQAgAAAAAAACBVBfnx2TN7zww8Y5H\nZ7y4tiH/6V4H/sOZF558RI+P+2KFp+6Z8PAzc5avr6obcPQ5l3yjz25VW8/97d//9XfTZ7yy\n4I2uPetGnn/pSQNqd8l+AAAAAAAAqAxFuoLwseu/97unV//DNy756XVXDuvbOGH8xQ8u3/Dx\nXmrp/WNvnjpz6BcvGDfmrJolT1xz2cTsg1NvvfCbMTf+/lNHnTL2x98/uW7T7eMue2VT8656\nCwAAAAAAAFABinEFYUvj8l+98NYJ1//stPralNKBBx+66rnTH5zw0ogbjjZHsi4AACAASURB\nVPn/fq1sy01TX+135k1fOqlPSqnfT9OXz/6fU1ad+dVPd0opTbhpeu/Trhs9oj6ldEj/n7y2\natzMpesPcREhAAAAAAAAfKAogbDhtf369DnlgC4fHMgd0bXDzHc3pJQKzWvvn3jHn2bMe7sx\nv2/fw0ac/c3PHfyfel6WNS5btmb//Xu1Pmx875nXG1ouGbZP68MOtccf1vnW559e/dUzDtiy\nfubs9VsuGtn3g2/Njxl/XRHeHVBWnnzyyddff713794nnnhiqbcAAAAAAEA5KkYgbN/1+Ftu\nOX7rw6YN83+zcsN+3+ifUrr7qjGPNQ644NJrenXJzZ/xyG1Xfatlwm+H71Oz9cktDX8bc9kN\nD067q/Xhlo3zUkqH1Hw4u76m+rGX3kspbVn3fEqp+8v/duWUR5b8fXP3/fqeetZ3vnD4h590\nuGbNmrVr16aUXnvttZqamk2bNrXpuwZKYvr06U8++eSJJ54oEAIAAAAAwA4VIxBua9ns6bfd\n+pumA75wzX/v2bD2wWmL1l0/5fL6muqUUt+DBjQ/97V7fvnK8OuO3Nm3Fxo3ppT2bFe19cie\n7aqa1jWllFoa16WUbpzw7Khvjj63e4dXn773V+NGN95+94henVufec8990yaNKn167q6ujlz\n5rTZuwQAAAAAAIAyVbxAuOWdBb/559senfv2CV8a/eOvDuuYy721Ym6WZVef8cVtn9apeUVK\nR6aspaGxKaXU3NCYUmpoaGg9m+9Qk1J6u6nQo32+9chbTS3VtdUppXx1VUrps98f948H16aU\n+tcdtnLmqI/5SYcAAAAAAABQoYoUCNcv+1+Xf+/2qkO/cOPEs/rv2fH9n92pfa6q0333Tspt\n88xcriqltOnNKWecf+/Wg6NGjWr94qaJo1N6ev7mph7tO7QeWbi5uWt915RSdc2BKc08tnfn\nrd91zKdrnn1r5daH55xzzsiRI1NKS5YsGT58eJZlbfJWAQAAAAAAoIwVIxBmhU0/vnJCh8/9\nH/buOzyr8vwD+PNmAgkQEmXIEkEBJQpShSIIcQ8QJ8UZB4pSxAriQsDRIoq4qFq3uKVu/SHW\nAchQ66yBSqyKgCgoG8JO3t8fQUBGCDFD8n4+V/847zn3/Zz7xD+4en2v55x+d1+ctXkWWK3O\n0aHg32N/Xnfiho8ORh8ZfPXSzpddfsQe1Wqf9eqrZ4UQ1q+aceqZm75BGKLr6ic9MHbqz12O\nbRBCWLfi04+Xrz01q24IoUqto2slPPnuV8syW2eEEEI0f8LcldX3a7rxdjVq1KhRo0YIYfny\n5WvWrCmHBwcAAAAAAIDfm/IICFf+9NR/V647L7PaJx9/vOnGVZu13u8PvVpnjL7qpioXndqi\nfurnbz3y2pcLr79696LWiiQOOLXFwIevf7fOlS3S1rwy6vaU+keevUdKCCESX/2qE/ceNGxo\n40vPbVU76bNxj7+3IvHKi1uU9dMBAAAAAADALqQ8AsLlX38XQnj0lr9tfrJGw2ufvKd91yF3\nrHng7//8xy2L1yXWb7J//5sHHZCSWPRqzf701z5r7nz69sELV0eaHtD5pgEXbtyVuO/ZN18c\n7n7hgdueWJvUuGnLfsMHd0hLLosnAgAAAAAAgF1UJAY/xTdjxoyWLVuGED788MODDz64oscB\nStPAgQPHjx+flZU1YsSIip4FAAAAAAB+j+IqegAAAAAAAACg/AgIAQAAAAAAIIYICAEAAAAA\nACCGCAgBAAAAAAAghggIAQAAAAAAIIYICAEAAAAAACCGCAgBAAAAAAAghggIAQAAAAAAIIYI\nCAEAAAAAACCGCAgBAAAAAAAghggIAQAAAAAAIIYICAEAAAAAACCGCAgBAAAAAAAghggIAQAA\nAAAAIIYICAEAAAAAACCGCAgBAAAAAAAghggIAQAAAAAAIIYICAEAAAAAACCGCAgBAAAAAAAg\nhggIAQAAAAAAIIYICAEAAAAAACCGCAgBAAAAAAAghggIAQAAAAAAIIYICAEAAAAAACCGCAgB\nAAAAAAAghggIAQAAAAAAIIYICAEAAAAAACCGCAgBAAAAAAAghggIAQAAAAAAIIYICAEAAAAA\nACCGCAgBAAAAAAAghggIAQAAAAAAIIYICAEAAAAAACCGCAgBAAAAAAAghggIAQAAAAAAIIYI\nCAEAAAAAACCGCAgBAAAAAAAghggIAQAAAAAAIIYICAEAAAAAACCGCAgBAAAAAAAghggIAQAA\nAAAAIIYICAEAAAAAACCGCAgBAAAAAAAghggIAQAAAAAAIIYICAEAAAAAACCGCAgBAAAAAAAg\nhggIAQAAAAAAIIYICAEAAAAAACCGCAgBAAAAAAAghggIAQAAAAAAIIYICAEAAAAAACCGCAgB\nAAAAAAAghggIAQAAAAAAIIYICAEAAAAAACCGCAgBAAAAAAAghggIAQAAAAAAIIYICAEAAAAA\n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\nAICICIQAAAAAAAAQEYEQAAAAAAAAIiIQAgAAAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAREQgB\nAAAAAAAgIgIhAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAABARgRAAAAAAAAAiIhACAAAAAABA\nRARCAAAAAAAAiIhACAAAAAAAABERCAEAAAAAACAiAiEAAAAAAABERCAEAAAAAACAiAiEAAAA\nAAAAEBGBEAAAAAAAACIiEAIAAAAAAEBEBEIAAAAAAACIiEAIAAAAAAAAEREIAQAAAAAAICIC\nIQAAAAAAAEREIAQAAAAAAICI5CQ9AFCnnvj7Hr+d3zbpKagF67f4Aw4AAAAAQE3492WIy7rN\n2es2Zyc9BQAAAAAAkBiPGAUAAAAAAICICIQAAAAAAAAQEY8Yhbg0yqtokFuR9BTUglXr61Wm\nkx4CAAAAAICvIIEQ4nLqQR8e2/WfSU9BLRg5+aDSzf6GAwAAAADwpXnEKAAAAAAAAEREIAQA\nAAAAAICICIQAAAAAAAAQEYEQAAAAAAAAIiIQAgAAAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAR\nEQgBAAAAAAAgIgIhAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAABARgRAAAAAAAAAiIhACAAAA\nAABARARCAAAAAAAAiIhACAAAAAAAABERCAEAAAAAACAiAiEAAAAAAABERCAEAAAAAACAiAiE\nAAAAAAAAEBGBEAAAAAAAACIiEAIAAAAAAEBEBEIAAAAAAACIiEAIAAAAAAAAEREIAQAAAAAA\nICICIQAAAAAAAEQkJ+kBAADgK6D1q0tavLk86SmoBblrNyU9AgAAACRMIAQAgB3L3lSWvaks\n6SkAAAAAaoFHjAIAAAAAAEBEBEIAAAAAAACIiEeMAgDAjlXUz63Iz016CmpB7tpNqfLKpKcA\nAACAJAmEAACwYx/17rB0ULekp6AWdL91Tv7StUlPAQAAAEnyiFEAAAAAAACIiEAIAAAAAAAA\nEREIAQAAAAAAICICIQAAAAAAAEREIAQAAAAAAICICIQAAAAAAAAQEYEQAAAAAAAAIiIQAgAA\nAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAAREQgBAAAAAAAgIgI\nhAAAAAAAABARgRAAAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhACAAAAAAAABERCAEAAAAA\nACAiAiEAAAAAAABERCAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAAACIiEAIAAAAAAEBEBEIA\nAAAAAACIiEAIAAAAAAAAEREIAQAAAAAAICICIQAAAAAAAEREIAQAAAAAAICICIQAAAAAAAAQ\nEYEQAAAAAAAAIiIQAgAAAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAREQgBAAAAAAAgIgIhAAAA\nAAAAREQgBAAAAAAAgIgIhAAAAAAAABARgRAAAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhA\nCAAAAAAAABERCAEAAAAAACAiAiEAAAAAAABERCAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAA\nACIiEAIAAAAAAEBEBEIAAAAAAACIiEAIAAAAAAAAEREIAQAAAAAAICICIQAAAAAAAEREIAQA\nAAAAAICICIQAAAAAAAAQEYEQAAAAAAAAIiIQAgAAAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAR\nEQgBAAAAAAAgIgIhAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAABARgRAAAAAAAAAiIhACAAAA\nAABARARCAAAAAAAAiIhACAAAAAAAABERCAEAAAAAACAiAiEAAAAAAABERCAEAAAAAACAiAiE\nAAAAAAAAEBGBEAAAAAAAACIiEAIAAAAAAEBEBEIAAAAAAACIiEAIAAAAAAAAEREIAQAAAAAA\nICICIQAAAAAAAEREIAQAAAAAAICICIQAAAAAAAAQEYEQAAAAAAAAIiIQAgAAAAAAQEQEQgAA\nAAAAAIiIQAgAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAABAR\ngRAAAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhACAAAAAAAABERCAEAAAAAACAiAiEAAAAA\nAABERCAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAAACIiEAIAAAAAAEBEBEIAAAAAAACIiEAI\nAAAAAAAAEREIAQAAAAAAICICIQAAAAAAAEREIAQAAAAAAICICIQAAAAAAAAQEYEQAAAAAAAA\nIiIQAgAAAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAAREQgBAAA\nAAAAgIgIhAAAAAAAABARgRAAAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhACAAAAAAAABER\nCAEAAAAAACAiAiEAAAAAAABERCAEAAAAAACAiAiEAAAAAAAAEBGBEAAAAAAAACIiEAIAAAAA\nAEBEBEIAAAAAAACISE7SAwB16uVFzd9f3SDpKagFm8r9Hx4AAAAAANSEQAhxWfhRo4UfNUp6\nCgAAAAAAIDECIcSioKBg48aNSU+xy7333ntr165t0qTJ3nvvnfQsdaFNmzZJjwAAAAAAwFeM\nQAixuPPOO5MeoS5ccsklM2fOPPTQQydMmJD0LAAAAAAAsDvyFVYAAAAAAAAQEYEQAAAAAAAA\nIiIQAgAAAAAAQEQEQgAAAAAAAIiIQAgAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAAREQgBAAA\nAAAAgIgIhAAAAAAAABARgRAAAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhACAAAAAAAABER\nCAEAAAAAACAiOUkPAAAAXwFN/rEq+6l5SU9BLai3ZlPSIwAAAEDCBEIAANix/KVr8peuSXoK\nAAAAgFogEAIAQHW6dOlSv379pKfY5ZYsWVJaWtq4ceMOHTokPUtdaN++fdIjAAAAQGIEQgAA\nqM64ceOSHqEuXHLJJTNnzjzssMMmTJiQ9CwAAADArpWV9AAAAAAAAABA3REIAQAAAAAAICIC\nIQAAAAAAAEREIAQAAAAAAICICIQAAAAAAAAQEYEQAAAAAAAAIiIQAgAAAAAAQEQEQgAAAAAA\nAIiIQAgAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAAREQgBAAAAAAAgIgIhAAAAAAAABARgRAA\nAAAAAAAiIhACAAAAAABARARCAAAAAAAAiIhACAAAAAAAABERCAEAAAAAACAiAiEAAAAAAABE\nRCAEAAAAAACAiAiEAAAAAAAAEBGBEAAA+P/t3Xm8lnP+P/DPffbOad9IKhWylKJkmcm+j7FL\nIWXfx1JjCyWDr7EU2SqMCoVhMDRofgwaS2ZCUmGEQuLgJZwAACAASURBVLTSejrb/fvj5HTU\n2Tp1zn26r+fzD4/u6/pc1/2+z/Vxfe7ret3XdQEAAAARIiAEAAAAAACACBEQAgAAAAAAQIQI\nCAEAAAAAACBCBIQAAAAAAAAQIQJCAAAAAAAAiBABIQAAAAAAAESIgBAAAAAAAAAiREAIAAAA\nAAAAESIgBAAAAAAAgAgREAIAAAAAAECECAgBAAAAAAAgQgSEAAAAAAAAECECQgAAAAAAAIgQ\nASEAAAAAAABEiIAQAAAAAAAAIkRACAAAAAAAABEiIAQAAAAAAIAIERACAAAAAABAhAgIAQAA\nAAAAIEIEhAAAAAAAABAhAkIAAAAAAACIEAEhAAAAAAAARIiAEAAAAAAAACJEQAgAAAAAAAAR\nIiAEAAAAAACACBEQAgAAAAAAQIQICAEAAAAAACBCBIQAAAAAAAAQIQJCAAAAAAAAiBABIQAA\nAAAAAESIgBAAAAAAAAAiREAIAAAAAAAAESIgBAAAAAAAgAgREAIAAAAAAECECAgBAAAAAAAg\nQgSEAAAAAAAAECECQgAAAAAAAIgQASEAAAAAAABEiIAQAAAAAAAAIkRACAAAAAAAABEiIAQA\nAAAAAIAIERACAAAAAABAhAgIAQAAAAAAIEIEhAAAAAAAABAhAkIAAAAAAACIEAEhAAAAAAAA\nRIiAEAAAAAAAACJEQAgAAAAAAAARIiAEAAAAAACACBEQAgAAAAAAQIQICAEAAAAAACBCBIQA\nAAAAAAAQIQJCAAAAAAAAiBABIQAAAAAAAESIgBAAAAAAAAAiREAIAAAAAAAAESIgBAAAAAAA\ngAgREAIAAAAAAECECAgBAAAAAAAgQgSEAAAAAAAAECECQgAAAAAAAIgQASEAAAAAAABEiIAQ\nAAAAAAAAIkRACAAAAAAAABEiIAQAAAAAAIAIERACAAAAAABAhAgIAQAAAAAAIEIEhAAAAAAA\nABAhAkIAAAAAAACIEAEhAAAAAAAARIiAEAAAAAAAACJEQAgAAAAAAAARIiAEAAAAAACACBEQ\nAgAAAAAAQIQICAEAAAAAACBCBIQAAAAAAAAQIQJCAAAAAAAAiBABIQAAAAAAAESIgBAAAAAA\nAAAiREAIAAAAAAAAESIgBAAAAAAAgAgREAIAAAAAAECECAgBAAAAAAAgQgSEAAAAAAAAECEC\nQgAAAAAAAIgQASEAAAAAAABEiIAQAAAAAAAAIkRACAAAAAAAABEiIAQAAAAAAIAIERACAAAA\nAABAhAgIAQAAAAAAIEIEhAAAAAAAABAhAkIAAAAAAACIEAEhAAAAAAAARIiAEAAAAAAAACJE\nQAgAAAAAAAARIiAEAAAAAACACBEQAgAAAAAAQIQICAEAAAAAACBCBIQAAAAAAAAQIQJCAAAA\nAAAAiBABIQAAAAAAAESIgBAAAAAAAAAiREAIAAAAAAAAESIgBAAAAAAAgAgREAIAAAAAAECE\n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\nYQtWzz7ptHXPICxvVWdsk1PRrF+bPXv2zjvvHEJ4//33e/bsWeMfHwAAAICkc8UVV2x4feTv\nfve7m266KSH1kMT23HPPDc/iDhs27KijjkpIPSSrRYsW9e7du+RBXcV23XXXsWPHlrcIsOVK\nqY03iaUPPGmnLx4Z+vq0z7+f88nDN9yd0/rQftvkZDTocU63Zo9fffMrb//36zmfPT/qmr/P\nWnzQPi2qsapKZgEAAADAZjV8+PDRo0c3bNgwJSUlNTW1adOmEyZMkA5SEz744IPu3buXvKxX\nr97UqVOlg2x2zZs3f/311/v167fddts1bty4U6dON910k3QQklWtXEEYQogXTh434qnJUxfn\nxjp23f+Cgedun50WQogX/vzs6Pv+MeXjpfnprdvv1vucC3vt0LD0cutfQVj+qiqZVYorCAEA\nAAAAAIis2goI6xIBIQAAAAAAAJFVK7cYBQAAAAAAAOoGASEAAAAAAABEiIAQAAAAAAAAIkRA\nCAAAAAAAABEiIAQAAAAAAIAIERACAAAAAABAhAgIAQAAAAAAIEIEhAAAAAAAABAhAkIAAAAA\nAACIEAEhAAAAAAAARIiAEAAAAAAAACJEQAgAAAAAAAARIiAEAAAAAACACBEQAgAAAAAAQIQI\nCAEAAAAAACBCBIQAAAAAAAAQIQJCAAAAAAAAiBABIQAAAAAAAESIgBAAAAAAAAAiREAIAAAA\nAAAAESIgBAAAAAAAgAgREAIAAAAAAECECAgBAAAAAAAgQgSEAAAAAAAAECECQgAAAAAAAIgQ\nASEAAAAAAABEiIAQAAAAAAAAIkRACAAAAAAAABEiIAQAAAAAAIAIERACAAAAAABAhAgIAQAA\nAAAAIEIEhAAAAAAAABAhAkIAAAAAAACIEAEhAAAAAAAARIiAEAAAAAAAACJEQAgAAAAAAAAR\nIiAEAAAAAACACBEQAgAAAAAAQIQICAEAAAAAACBCBIQAAAAAAAAQIQJCAAAAAAAAiBABIQAA\nAAAAAESIgBAAAAAAAAAiREAIAAAAAAAAESIgBAAAAAAAgAgREAIAAAAAAECECAgBAAAAAAAg\nQgSEAAAAAAAAECECQgAAAAAAAIgQASEAAAAAAABEiIAQAAAAAAAAIkRACAAAAAAAABEiIAQA\nAAAAAIAIERACAAAAAABAhKQluoBEGjdu3BtvvJHoKgAAAAAAgEg7/PDDu3XrlugqiJAoBoQ5\nOTmHHHLI66+/fv/99ye6lqhISUmpX79+CGHlypWFhYWJLodklpGRkZWVFY/Hly9fnuhaSHLZ\n2dlpaWn5+fmrV69OdC0kuYYNG4YQVq9enZ+fn+haSGZpaWnZ2dkhhOXLl8fj8USXQzLLysrK\nyMgoKChYtWpVomshydWvXz8lJSU3NzcvLy/RtZDMUlNTc3JyQggrVqwoKipKdDkks8zMzMzM\nzKKiohUrViS6FpJcTk5OampqXl5ebm5uomuJkEaNGgkIqU1RDAjbtGkzefLkVq1arVmzJtG1\nREV6enqbNm1CCN9//71BhRrVqFGjZs2aFRUVff3114muhSTXqlWrevXqrVixYsGCBYmuhWQW\ni8Xat28fQliwYIGzANSonJycrbbaKoTw1VdfCQipUS1atGjQoMHq1avnz5+f6FpIcu3atUtN\nTV28ePHPP/+c6FpIZpmZma1btw4hzJs3zy+6qFFNmjRp0qRJfn7+vHnzEl0LSa5169aZmZk/\n//zz4sWLE11LhGRmZia6BKIligFhMceitem777479thjQwiTJk3yIwhq1MSJE++8885GjRot\nWbIk0bWQ5C655JL33nuvd+/ew4YNS3QtJLP8/Px99tknhPDwww8fdthhiS6HZPb6669fddVV\nIYR58+YVX0oINWTYsGEvvvjib3/721GjRiW6FpLcYYcdtmTJkptuuumMM85IdC0ks5kzZxb3\nsffee6/4p11QQ0aPHj169Oj27dt//PHHia6FJNevX79Zs2ZdcMEFAwcOTHQtQE1JSXQBAAAA\nAAAAQO0REAIAAAAAAECExDxfhFqwevXqf//73yGEHj16NG7cONHlkMzmzp37+eefp6WlHXDA\nAYmuhSQ3bdq0JUuWtGrVatddd010LSSzoqKi119/PYTQpUuX4ufDQQ1ZsGDB9OnTQwgHHnhg\nampqosshmc2cOfP7779v0qRJ9+7dE10LSe6tt97Ky8vbYYcd2rVrl+haSGbLli2bOnVqCGGf\nffbJyclJdDkkszlz5syZMyc7O3vfffdNdC0kualTpy5btqxt27Y77rhjomsBaoqAEAAAAAAA\nACLELUYBAAAAAAAgQgSEAAAAAAAAECFpiS6AZBAvXHZm7zOW5BddOf6ZAxpllkx/5pw+L9Yf\nOH7EnqUbf3B5v7tWHDPx4ZOr0oA6rrxNv7HyV31yYp/Bt0x8tkt2ehUXWTH/2xVZLbduklHt\n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\nAAAAECH/H+dJUEHo/ikFAAAAAElFTkSuQmCC"
     },
     "metadata": {
      "image/png": {
       "height": 720,
       "width": 1200
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "data_long <- gather(data1[3:12], key = \"Variabel\", value = \"Nilai\")\n",
    "head(data_long)\n",
    "\n",
    "ggplot(data_long, aes(x = Variabel, y = Nilai, fill = Variabel)) +\n",
    "  geom_boxplot() +\n",
    "  labs(x = \"Variabel\", y = \"Nilai\") +\n",
    "  theme_classic()\n",
    "\n",
    "ggsave(\"output/eda_boxp.png\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "919b81c5",
   "metadata": {
    "papermill": {
     "duration": 0.016783,
     "end_time": "2023-05-14T08:05:06.591263",
     "exception": false,
     "start_time": "2023-05-14T08:05:06.574480",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Imbalence Data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "5eba0197",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:06.627346Z",
     "iopub.status.busy": "2023-05-14T08:05:06.626094Z",
     "iopub.status.idle": "2023-05-14T08:05:06.655500Z",
     "shell.execute_reply": "2023-05-14T08:05:06.653785Z"
    },
    "papermill": {
     "duration": 0.049441,
     "end_time": "2023-05-14T08:05:06.657569",
     "exception": false,
     "start_time": "2023-05-14T08:05:06.608128",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 27 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Daerah</th><th scope=col>length(Daerah)</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>KABUPATEN BANDUNG      </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN BANDUNG BARAT</td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN BEKASI       </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN BOGOR        </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN CIAMIS       </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN CIANJUR      </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN CIREBON      </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN GARUT        </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN INDRAMAYU    </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN KARAWANG     </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN KUNINGAN     </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN MAJALENGKA   </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN PANGANDARAN  </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN PURWAKARTA   </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN SUBANG       </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN SUKABUMI     </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN SUMEDANG     </td><td>6</td></tr>\n",
       "\t<tr><td>KABUPATEN TASIKMALAYA  </td><td>6</td></tr>\n",
       "\t<tr><td>KOTA BANDUNG           </td><td>6</td></tr>\n",
       "\t<tr><td>KOTA BANJAR            </td><td>6</td></tr>\n",
       "\t<tr><td>KOTA BEKASI            </td><td>6</td></tr>\n",
       "\t<tr><td>KOTA BOGOR             </td><td>6</td></tr>\n",
       "\t<tr><td>KOTA CIMAHI            </td><td>6</td></tr>\n",
       "\t<tr><td>KOTA CIREBON           </td><td>6</td></tr>\n",
       "\t<tr><td>KOTA DEPOK             </td><td>6</td></tr>\n",
       "\t<tr><td>KOTA SUKABUMI          </td><td>6</td></tr>\n",
       "\t<tr><td>KOTA TASIKMALAYA       </td><td>6</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 27 × 2\n",
       "\\begin{tabular}{ll}\n",
       " Daerah & length(Daerah)\\\\\n",
       " <chr> & <int>\\\\\n",
       "\\hline\n",
       "\t KABUPATEN BANDUNG       & 6\\\\\n",
       "\t KABUPATEN BANDUNG BARAT & 6\\\\\n",
       "\t KABUPATEN BEKASI        & 6\\\\\n",
       "\t KABUPATEN BOGOR         & 6\\\\\n",
       "\t KABUPATEN CIAMIS        & 6\\\\\n",
       "\t KABUPATEN CIANJUR       & 6\\\\\n",
       "\t KABUPATEN CIREBON       & 6\\\\\n",
       "\t KABUPATEN GARUT         & 6\\\\\n",
       "\t KABUPATEN INDRAMAYU     & 6\\\\\n",
       "\t KABUPATEN KARAWANG      & 6\\\\\n",
       "\t KABUPATEN KUNINGAN      & 6\\\\\n",
       "\t KABUPATEN MAJALENGKA    & 6\\\\\n",
       "\t KABUPATEN PANGANDARAN   & 6\\\\\n",
       "\t KABUPATEN PURWAKARTA    & 6\\\\\n",
       "\t KABUPATEN SUBANG        & 6\\\\\n",
       "\t KABUPATEN SUKABUMI      & 6\\\\\n",
       "\t KABUPATEN SUMEDANG      & 6\\\\\n",
       "\t KABUPATEN TASIKMALAYA   & 6\\\\\n",
       "\t KOTA BANDUNG            & 6\\\\\n",
       "\t KOTA BANJAR             & 6\\\\\n",
       "\t KOTA BEKASI             & 6\\\\\n",
       "\t KOTA BOGOR              & 6\\\\\n",
       "\t KOTA CIMAHI             & 6\\\\\n",
       "\t KOTA CIREBON            & 6\\\\\n",
       "\t KOTA DEPOK              & 6\\\\\n",
       "\t KOTA SUKABUMI           & 6\\\\\n",
       "\t KOTA TASIKMALAYA        & 6\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 27 × 2\n",
       "\n",
       "| Daerah &lt;chr&gt; | length(Daerah) &lt;int&gt; |\n",
       "|---|---|\n",
       "| KABUPATEN BANDUNG       | 6 |\n",
       "| KABUPATEN BANDUNG BARAT | 6 |\n",
       "| KABUPATEN BEKASI        | 6 |\n",
       "| KABUPATEN BOGOR         | 6 |\n",
       "| KABUPATEN CIAMIS        | 6 |\n",
       "| KABUPATEN CIANJUR       | 6 |\n",
       "| KABUPATEN CIREBON       | 6 |\n",
       "| KABUPATEN GARUT         | 6 |\n",
       "| KABUPATEN INDRAMAYU     | 6 |\n",
       "| KABUPATEN KARAWANG      | 6 |\n",
       "| KABUPATEN KUNINGAN      | 6 |\n",
       "| KABUPATEN MAJALENGKA    | 6 |\n",
       "| KABUPATEN PANGANDARAN   | 6 |\n",
       "| KABUPATEN PURWAKARTA    | 6 |\n",
       "| KABUPATEN SUBANG        | 6 |\n",
       "| KABUPATEN SUKABUMI      | 6 |\n",
       "| KABUPATEN SUMEDANG      | 6 |\n",
       "| KABUPATEN TASIKMALAYA   | 6 |\n",
       "| KOTA BANDUNG            | 6 |\n",
       "| KOTA BANJAR             | 6 |\n",
       "| KOTA BEKASI             | 6 |\n",
       "| KOTA BOGOR              | 6 |\n",
       "| KOTA CIMAHI             | 6 |\n",
       "| KOTA CIREBON            | 6 |\n",
       "| KOTA DEPOK              | 6 |\n",
       "| KOTA SUKABUMI           | 6 |\n",
       "| KOTA TASIKMALAYA        | 6 |\n",
       "\n"
      ],
      "text/plain": [
       "   Daerah                  length(Daerah)\n",
       "1  KABUPATEN BANDUNG       6             \n",
       "2  KABUPATEN BANDUNG BARAT 6             \n",
       "3  KABUPATEN BEKASI        6             \n",
       "4  KABUPATEN BOGOR         6             \n",
       "5  KABUPATEN CIAMIS        6             \n",
       "6  KABUPATEN CIANJUR       6             \n",
       "7  KABUPATEN CIREBON       6             \n",
       "8  KABUPATEN GARUT         6             \n",
       "9  KABUPATEN INDRAMAYU     6             \n",
       "10 KABUPATEN KARAWANG      6             \n",
       "11 KABUPATEN KUNINGAN      6             \n",
       "12 KABUPATEN MAJALENGKA    6             \n",
       "13 KABUPATEN PANGANDARAN   6             \n",
       "14 KABUPATEN PURWAKARTA    6             \n",
       "15 KABUPATEN SUBANG        6             \n",
       "16 KABUPATEN SUKABUMI      6             \n",
       "17 KABUPATEN SUMEDANG      6             \n",
       "18 KABUPATEN TASIKMALAYA   6             \n",
       "19 KOTA BANDUNG            6             \n",
       "20 KOTA BANJAR             6             \n",
       "21 KOTA BEKASI             6             \n",
       "22 KOTA BOGOR              6             \n",
       "23 KOTA CIMAHI             6             \n",
       "24 KOTA CIREBON            6             \n",
       "25 KOTA DEPOK              6             \n",
       "26 KOTA SUKABUMI           6             \n",
       "27 KOTA TASIKMALAYA        6             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "data1 %>% group_by(Daerah) %>% summarize(length(Daerah))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ef5f650d",
   "metadata": {
    "papermill": {
     "duration": 0.016998,
     "end_time": "2023-05-14T08:05:06.691858",
     "exception": false,
     "start_time": "2023-05-14T08:05:06.674860",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Scaling Data"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "fcc75661",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:06.728091Z",
     "iopub.status.busy": "2023-05-14T08:05:06.727002Z",
     "iopub.status.idle": "2023-05-14T08:05:06.748161Z",
     "shell.execute_reply": "2023-05-14T08:05:06.746634Z"
    },
    "papermill": {
     "duration": 0.041475,
     "end_time": "2023-05-14T08:05:06.750187",
     "exception": false,
     "start_time": "2023-05-14T08:05:06.708712",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "tibble [162 × 12] (S3: tbl_df/tbl/data.frame)\n",
      " $ Daerah          : chr [1:162] \"KABUPATEN BOGOR\" \"KABUPATEN SUKABUMI\" \"KABUPATEN CIANJUR\" \"KABUPATEN BANDUNG\" ...\n",
      " $ Tahun           : num [1:162] 2022 2022 2022 2022 2022 ...\n",
      " $ Stunting        : num [1:162] 24.9 27.5 13.6 25 23.6 27.2 18.6 19.4 18.6 24.3 ...\n",
      " $ AHH             : num [1:162] 71.6 71.5 70.6 74 71.7 ...\n",
      " $ PDRB            : num [1:162] 30173 17953 13590 23782 15991 ...\n",
      " $ Miskin          : num [1:162] 7.73 7.34 10.55 6.8 10.42 ...\n",
      " $ Pengeluaran     : num [1:162] 10860 9210 8244 10588 8227 ...\n",
      " $ Angkatan_Kerja  : num [1:162] 2897332 1313905 1222589 1808799 1330353 ...\n",
      " $ Penduduk_Bekerja: num [1:162] 2589167 1211763 1119786 1682510 1229218 ...\n",
      " $ TPAK            : num [1:162] 63.8 69.1 70 63.6 68.8 ...\n",
      " $ TPT             : num [1:162] 10.64 7.77 8.41 6.98 7.6 ...\n",
      " $ RLS             : num [1:162] 8.34 7.11 7.2 9.08 7.83 7.73 8 7.88 7.4 7.49 ...\n"
     ]
    }
   ],
   "source": [
    "str(data1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "3a21f509",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:06.789167Z",
     "iopub.status.busy": "2023-05-14T08:05:06.787980Z",
     "iopub.status.idle": "2023-05-14T08:05:06.805413Z",
     "shell.execute_reply": "2023-05-14T08:05:06.803913Z"
    },
    "papermill": {
     "duration": 0.039948,
     "end_time": "2023-05-14T08:05:06.807490",
     "exception": false,
     "start_time": "2023-05-14T08:05:06.767542",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "    Daerah              Tahun         Stunting          AHH       \n",
       " Length:162         Min.   :2017   Min.   : 1.08   Min.   :68.71  \n",
       " Class :character   1st Qu.:2018   1st Qu.: 5.91   1st Qu.:71.11  \n",
       " Mode  :character   Median :2020   Median : 9.02   Median :72.03  \n",
       "                    Mean   :2020   Mean   :10.68   Mean   :72.16  \n",
       "                    3rd Qu.:2021   3rd Qu.:13.91   3rd Qu.:73.34  \n",
       "                    Max.   :2022   Max.   :27.60   Max.   :75.44  \n",
       "      PDRB           Miskin        Pengeluaran    Angkatan_Kerja   \n",
       " Min.   :12627   Min.   : 2.070   Min.   : 7250   Min.   :  89369  \n",
       " 1st Qu.:17001   1st Qu.: 6.673   1st Qu.: 9290   1st Qu.: 453253  \n",
       " Median :20969   Median : 8.460   Median :10336   Median : 818045  \n",
       " Mean   :28760   Mean   : 8.438   Mean   :10714   Mean   : 884897  \n",
       " 3rd Qu.:32629   3rd Qu.:10.545   3rd Qu.:11391   3rd Qu.:1182484  \n",
       " Max.   :85820   Max.   :14.800   Max.   :17639   Max.   :2897332  \n",
       " Penduduk_Bekerja       TPAK            TPT              RLS        \n",
       " Min.   :  84032   Min.   :55.74   Min.   : 1.560   Min.   : 5.970  \n",
       " 1st Qu.: 411509   1st Qu.:62.67   1st Qu.: 7.018   1st Qu.: 7.350  \n",
       " Median : 746152   Median :64.36   Median : 8.645   Median : 8.095  \n",
       " Mean   : 806638   Mean   :64.89   Mean   : 8.457   Mean   : 8.499  \n",
       " 3rd Qu.:1069850   3rd Qu.:66.52   3rd Qu.: 9.800   3rd Qu.: 9.530  \n",
       " Max.   :2589167   Max.   :79.92   Max.   :14.290   Max.   :11.470  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(data1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "e51ad6bb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:06.865708Z",
     "iopub.status.busy": "2023-05-14T08:05:06.864577Z",
     "iopub.status.idle": "2023-05-14T08:05:06.900256Z",
     "shell.execute_reply": "2023-05-14T08:05:06.898416Z"
    },
    "papermill": {
     "duration": 0.056507,
     "end_time": "2023-05-14T08:05:06.902354",
     "exception": false,
     "start_time": "2023-05-14T08:05:06.845847",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 10 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Daerah</th><th scope=col>Tahun</th><th scope=col>Stunting</th><th scope=col>AHH</th><th scope=col>PDRB</th><th scope=col>Miskin</th><th scope=col>Pengeluaran</th><th scope=col>Angkatan_Kerja</th><th scope=col>Penduduk_Bekerja</th><th scope=col>TPAK</th><th scope=col>TPT</th><th scope=col>RLS</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>KABUPATEN BOGOR      </td><td>2022</td><td>2.284100</td><td>-0.36105857</td><td> 0.07668246</td><td>-0.2482812</td><td> 0.06445909</td><td> 3.3852035</td><td> 3.3334472</td><td>-0.3048521</td><td> 0.96364514</td><td>-0.1092061</td></tr>\n",
       "\t<tr><td>KABUPATEN SUKABUMI   </td><td>2022</td><td>2.701660</td><td>-0.45018062</td><td>-0.58662698</td><td>-0.3850893</td><td>-0.66352447</td><td> 0.7216528</td><td> 0.7576109</td><td> 1.1223053</td><td>-0.30328499</td><td>-0.9539420</td></tr>\n",
       "\t<tr><td>KABUPATEN CIANJUR    </td><td>2022</td><td>0.469319</td><td>-1.09460161</td><td>-0.82345342</td><td> 0.7409461</td><td>-1.08972575</td><td> 0.5680462</td><td> 0.5856078</td><td> 1.3539521</td><td>-0.02076399</td><td>-0.8921321</td></tr>\n",
       "\t<tr><td>KABUPATEN BANDUNG    </td><td>2022</td><td>2.300160</td><td> 1.24999391</td><td>-0.27022512</td><td>-0.5745158</td><td>-0.05554790</td><td> 1.5541353</td><td> 1.6379388</td><td>-0.3341408</td><td>-0.65202186</td><td> 0.3990091</td></tr>\n",
       "\t<tr><td>KABUPATEN GARUT      </td><td>2022</td><td>2.075320</td><td>-0.28564760</td><td>-0.69312560</td><td> 0.6953434</td><td>-1.09722619</td><td> 0.7493207</td><td> 0.7902529</td><td> 1.0504149</td><td>-0.37832963</td><td>-0.4594624</td></tr>\n",
       "\t<tr><td>KABUPATEN TASIKMALAYA</td><td>2022</td><td>2.653480</td><td>-1.52650078</td><td>-0.81048034</td><td> 0.8040882</td><td>-1.11928630</td><td> 0.0938905</td><td> 0.1773350</td><td> 0.7814916</td><td>-1.89246565</td><td>-0.5281402</td></tr>\n",
       "\t<tr><td>KABUPATEN CIAMIS     </td><td>2022</td><td>1.272319</td><td> 0.09826278</td><td>-0.52062172</td><td>-0.2517891</td><td>-0.56734240</td><td>-0.3707006</td><td>-0.3123717</td><td> 0.9518985</td><td>-2.07787006</td><td>-0.3427103</td></tr>\n",
       "\t<tr><td>KABUPATEN KUNINGAN   </td><td>2022</td><td>1.400800</td><td> 1.28427162</td><td>-0.72379416</td><td> 1.5161916</td><td>-0.48263158</td><td>-0.5955997</td><td>-0.6131718</td><td>-0.8240605</td><td> 0.59725071</td><td>-0.4251236</td></tr>\n",
       "\t<tr><td>KABUPATEN CIREBON    </td><td>2022</td><td>1.272319</td><td> 0.20795145</td><td>-0.72835373</td><td> 1.2530992</td><td> 0.03401614</td><td> 0.3795453</td><td> 0.3997700</td><td> 0.1690920</td><td>-0.15319571</td><td>-0.7547766</td></tr>\n",
       "\t<tr><td>KABUPATEN MAJALENGKA </td><td>2022</td><td>2.187740</td><td>-0.97120185</td><td>-0.57338250</td><td> 1.2285439</td><td>-0.33703487</td><td>-0.4050079</td><td>-0.3540368</td><td> 0.3501493</td><td>-1.89688004</td><td>-0.6929667</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 10 × 12\n",
       "\\begin{tabular}{llllllllllll}\n",
       " Daerah & Tahun & Stunting & AHH & PDRB & Miskin & Pengeluaran & Angkatan\\_Kerja & Penduduk\\_Bekerja & TPAK & TPT & RLS\\\\\n",
       " <chr> & <dbl> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}>\\\\\n",
       "\\hline\n",
       "\t KABUPATEN BOGOR       & 2022 & 2.284100 & -0.36105857 &  0.07668246 & -0.2482812 &  0.06445909 &  3.3852035 &  3.3334472 & -0.3048521 &  0.96364514 & -0.1092061\\\\\n",
       "\t KABUPATEN SUKABUMI    & 2022 & 2.701660 & -0.45018062 & -0.58662698 & -0.3850893 & -0.66352447 &  0.7216528 &  0.7576109 &  1.1223053 & -0.30328499 & -0.9539420\\\\\n",
       "\t KABUPATEN CIANJUR     & 2022 & 0.469319 & -1.09460161 & -0.82345342 &  0.7409461 & -1.08972575 &  0.5680462 &  0.5856078 &  1.3539521 & -0.02076399 & -0.8921321\\\\\n",
       "\t KABUPATEN BANDUNG     & 2022 & 2.300160 &  1.24999391 & -0.27022512 & -0.5745158 & -0.05554790 &  1.5541353 &  1.6379388 & -0.3341408 & -0.65202186 &  0.3990091\\\\\n",
       "\t KABUPATEN GARUT       & 2022 & 2.075320 & -0.28564760 & -0.69312560 &  0.6953434 & -1.09722619 &  0.7493207 &  0.7902529 &  1.0504149 & -0.37832963 & -0.4594624\\\\\n",
       "\t KABUPATEN TASIKMALAYA & 2022 & 2.653480 & -1.52650078 & -0.81048034 &  0.8040882 & -1.11928630 &  0.0938905 &  0.1773350 &  0.7814916 & -1.89246565 & -0.5281402\\\\\n",
       "\t KABUPATEN CIAMIS      & 2022 & 1.272319 &  0.09826278 & -0.52062172 & -0.2517891 & -0.56734240 & -0.3707006 & -0.3123717 &  0.9518985 & -2.07787006 & -0.3427103\\\\\n",
       "\t KABUPATEN KUNINGAN    & 2022 & 1.400800 &  1.28427162 & -0.72379416 &  1.5161916 & -0.48263158 & -0.5955997 & -0.6131718 & -0.8240605 &  0.59725071 & -0.4251236\\\\\n",
       "\t KABUPATEN CIREBON     & 2022 & 1.272319 &  0.20795145 & -0.72835373 &  1.2530992 &  0.03401614 &  0.3795453 &  0.3997700 &  0.1690920 & -0.15319571 & -0.7547766\\\\\n",
       "\t KABUPATEN MAJALENGKA  & 2022 & 2.187740 & -0.97120185 & -0.57338250 &  1.2285439 & -0.33703487 & -0.4050079 & -0.3540368 &  0.3501493 & -1.89688004 & -0.6929667\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 10 × 12\n",
       "\n",
       "| Daerah &lt;chr&gt; | Tahun &lt;dbl&gt; | Stunting &lt;dbl[,1]&gt; | AHH &lt;dbl[,1]&gt; | PDRB &lt;dbl[,1]&gt; | Miskin &lt;dbl[,1]&gt; | Pengeluaran &lt;dbl[,1]&gt; | Angkatan_Kerja &lt;dbl[,1]&gt; | Penduduk_Bekerja &lt;dbl[,1]&gt; | TPAK &lt;dbl[,1]&gt; | TPT &lt;dbl[,1]&gt; | RLS &lt;dbl[,1]&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| KABUPATEN BOGOR       | 2022 | 2.284100 | -0.36105857 |  0.07668246 | -0.2482812 |  0.06445909 |  3.3852035 |  3.3334472 | -0.3048521 |  0.96364514 | -0.1092061 |\n",
       "| KABUPATEN SUKABUMI    | 2022 | 2.701660 | -0.45018062 | -0.58662698 | -0.3850893 | -0.66352447 |  0.7216528 |  0.7576109 |  1.1223053 | -0.30328499 | -0.9539420 |\n",
       "| KABUPATEN CIANJUR     | 2022 | 0.469319 | -1.09460161 | -0.82345342 |  0.7409461 | -1.08972575 |  0.5680462 |  0.5856078 |  1.3539521 | -0.02076399 | -0.8921321 |\n",
       "| KABUPATEN BANDUNG     | 2022 | 2.300160 |  1.24999391 | -0.27022512 | -0.5745158 | -0.05554790 |  1.5541353 |  1.6379388 | -0.3341408 | -0.65202186 |  0.3990091 |\n",
       "| KABUPATEN GARUT       | 2022 | 2.075320 | -0.28564760 | -0.69312560 |  0.6953434 | -1.09722619 |  0.7493207 |  0.7902529 |  1.0504149 | -0.37832963 | -0.4594624 |\n",
       "| KABUPATEN TASIKMALAYA | 2022 | 2.653480 | -1.52650078 | -0.81048034 |  0.8040882 | -1.11928630 |  0.0938905 |  0.1773350 |  0.7814916 | -1.89246565 | -0.5281402 |\n",
       "| KABUPATEN CIAMIS      | 2022 | 1.272319 |  0.09826278 | -0.52062172 | -0.2517891 | -0.56734240 | -0.3707006 | -0.3123717 |  0.9518985 | -2.07787006 | -0.3427103 |\n",
       "| KABUPATEN KUNINGAN    | 2022 | 1.400800 |  1.28427162 | -0.72379416 |  1.5161916 | -0.48263158 | -0.5955997 | -0.6131718 | -0.8240605 |  0.59725071 | -0.4251236 |\n",
       "| KABUPATEN CIREBON     | 2022 | 1.272319 |  0.20795145 | -0.72835373 |  1.2530992 |  0.03401614 |  0.3795453 |  0.3997700 |  0.1690920 | -0.15319571 | -0.7547766 |\n",
       "| KABUPATEN MAJALENGKA  | 2022 | 2.187740 | -0.97120185 | -0.57338250 |  1.2285439 | -0.33703487 | -0.4050079 | -0.3540368 |  0.3501493 | -1.89688004 | -0.6929667 |\n",
       "\n"
      ],
      "text/plain": [
       "   Daerah                Tahun Stunting AHH         PDRB        Miskin    \n",
       "1  KABUPATEN BOGOR       2022  2.284100 -0.36105857  0.07668246 -0.2482812\n",
       "2  KABUPATEN SUKABUMI    2022  2.701660 -0.45018062 -0.58662698 -0.3850893\n",
       "3  KABUPATEN CIANJUR     2022  0.469319 -1.09460161 -0.82345342  0.7409461\n",
       "4  KABUPATEN BANDUNG     2022  2.300160  1.24999391 -0.27022512 -0.5745158\n",
       "5  KABUPATEN GARUT       2022  2.075320 -0.28564760 -0.69312560  0.6953434\n",
       "6  KABUPATEN TASIKMALAYA 2022  2.653480 -1.52650078 -0.81048034  0.8040882\n",
       "7  KABUPATEN CIAMIS      2022  1.272319  0.09826278 -0.52062172 -0.2517891\n",
       "8  KABUPATEN KUNINGAN    2022  1.400800  1.28427162 -0.72379416  1.5161916\n",
       "9  KABUPATEN CIREBON     2022  1.272319  0.20795145 -0.72835373  1.2530992\n",
       "10 KABUPATEN MAJALENGKA  2022  2.187740 -0.97120185 -0.57338250  1.2285439\n",
       "   Pengeluaran Angkatan_Kerja Penduduk_Bekerja TPAK       TPT        \n",
       "1   0.06445909  3.3852035      3.3334472       -0.3048521  0.96364514\n",
       "2  -0.66352447  0.7216528      0.7576109        1.1223053 -0.30328499\n",
       "3  -1.08972575  0.5680462      0.5856078        1.3539521 -0.02076399\n",
       "4  -0.05554790  1.5541353      1.6379388       -0.3341408 -0.65202186\n",
       "5  -1.09722619  0.7493207      0.7902529        1.0504149 -0.37832963\n",
       "6  -1.11928630  0.0938905      0.1773350        0.7814916 -1.89246565\n",
       "7  -0.56734240 -0.3707006     -0.3123717        0.9518985 -2.07787006\n",
       "8  -0.48263158 -0.5955997     -0.6131718       -0.8240605  0.59725071\n",
       "9   0.03401614  0.3795453      0.3997700        0.1690920 -0.15319571\n",
       "10 -0.33703487 -0.4050079     -0.3540368        0.3501493 -1.89688004\n",
       "   RLS       \n",
       "1  -0.1092061\n",
       "2  -0.9539420\n",
       "3  -0.8921321\n",
       "4   0.3990091\n",
       "5  -0.4594624\n",
       "6  -0.5281402\n",
       "7  -0.3427103\n",
       "8  -0.4251236\n",
       "9  -0.7547766\n",
       "10 -0.6929667"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "num_col = c(3:12)\n",
    "data2 = data1\n",
    "data2[num_col] = lapply(data2[num_col], scale)\n",
    "head(data2, 10)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "d39d24d6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:06.940869Z",
     "iopub.status.busy": "2023-05-14T08:05:06.939739Z",
     "iopub.status.idle": "2023-05-14T08:05:06.959112Z",
     "shell.execute_reply": "2023-05-14T08:05:06.957408Z"
    },
    "papermill": {
     "duration": 0.04068,
     "end_time": "2023-05-14T08:05:06.961185",
     "exception": false,
     "start_time": "2023-05-14T08:05:06.920505",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "    Daerah              Tahun          Stunting.V1             AHH.V1       \n",
       " Length:162         Min.   :2017   Min.   :-1.5413940   Min.   :-2.3628770  \n",
       " Class :character   1st Qu.:2018   1st Qu.:-0.7656956   1st Qu.:-0.7158329  \n",
       " Mode  :character   Median :2020   Median :-0.2662293   Median :-0.0902646  \n",
       "                    Mean   :2020   Mean   : 0.0000000   Mean   : 0.0000000  \n",
       "                    3rd Qu.:2021   3rd Qu.: 0.5195066   3rd Qu.: 0.8095253  \n",
       "                    Max.   :2022   Max.   : 2.7177202   Max.   : 2.2509031  \n",
       "       PDRB.V1             Miskin.V1          Pengeluaran.V1   \n",
       " Min.   :-0.8757257   Min.   :-2.2337516   Min.   :-1.5282807  \n",
       " 1st Qu.:-0.6383157   1st Qu.:-0.6192415   1st Qu.:-0.6281180  \n",
       " Median :-0.4229166   Median : 0.0077953   Median :-0.1669514  \n",
       " Mean   : 0.0000000   Mean   : 0.0000000   Mean   : 0.0000000  \n",
       " 3rd Qu.: 0.2100093   3rd Qu.: 0.7391921   3rd Qu.: 0.2986271  \n",
       " Max.   : 3.0972373   Max.   : 2.2318028   Max.   : 3.0553685  \n",
       "  Angkatan_Kerja.V1  Penduduk_Bekerja.V1       TPAK.V1      \n",
       " Min.   :-1.338192   Min.   :-1.351321   Min.   :-2.437600  \n",
       " 1st Qu.:-0.726087   1st Qu.:-0.738916   1st Qu.:-0.591748  \n",
       " Median :-0.112455   Median :-0.113112   Median :-0.142433  \n",
       " Mean   : 0.000000   Mean   : 0.000000   Mean   : 0.000000  \n",
       " 3rd Qu.: 0.500583   3rd Qu.: 0.492225   3rd Qu.: 0.432024  \n",
       " Max.   : 3.385203   Max.   : 3.333447   Max.   : 4.000584  \n",
       "        TPT.V1               RLS.V1       \n",
       " Min.   :-3.0446216   Min.   :-1.7368681  \n",
       " 1st Qu.:-0.6354679   1st Qu.:-0.7891155  \n",
       " Median : 0.0829742   Median :-0.2774665  \n",
       " Mean   : 0.0000000   Mean   : 0.0000000  \n",
       " 3rd Qu.: 0.5928363   3rd Qu.: 0.7080588  \n",
       " Max.   : 2.5748978   Max.   : 2.0404067  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(data2)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "0f0b294d",
   "metadata": {
    "papermill": {
     "duration": 0.017239,
     "end_time": "2023-05-14T08:05:06.996254",
     "exception": false,
     "start_time": "2023-05-14T08:05:06.979015",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "# PANEL MODEL & ANALISIS"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "a668bd19",
   "metadata": {
    "papermill": {
     "duration": 0.017146,
     "end_time": "2023-05-14T08:05:07.030784",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.013638",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Baseline"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "5cdcbb72",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:07.068104Z",
     "iopub.status.busy": "2023-05-14T08:05:07.067001Z",
     "iopub.status.idle": "2023-05-14T08:05:07.094642Z",
     "shell.execute_reply": "2023-05-14T08:05:07.092961Z"
    },
    "papermill": {
     "duration": 0.048601,
     "end_time": "2023-05-14T08:05:07.096755",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.048154",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A tibble: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Stunting</th><th scope=col>AHH</th><th scope=col>PDRB</th><th scope=col>Miskin</th><th scope=col>Pengeluaran</th><th scope=col>Angkatan_Kerja</th><th scope=col>Penduduk_Bekerja</th><th scope=col>TPAK</th><th scope=col>TPT</th><th scope=col>RLS</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th><th scope=col>&lt;dbl[,1]&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>2.284100</td><td>-0.3610586</td><td> 0.07668246</td><td>-0.2482812</td><td> 0.06445909</td><td>3.3852035</td><td>3.3334472</td><td>-0.3048521</td><td> 0.96364514</td><td>-0.1092061</td></tr>\n",
       "\t<tr><td>2.701660</td><td>-0.4501806</td><td>-0.58662698</td><td>-0.3850893</td><td>-0.66352447</td><td>0.7216528</td><td>0.7576109</td><td> 1.1223053</td><td>-0.30328499</td><td>-0.9539420</td></tr>\n",
       "\t<tr><td>0.469319</td><td>-1.0946016</td><td>-0.82345342</td><td> 0.7409461</td><td>-1.08972575</td><td>0.5680462</td><td>0.5856078</td><td> 1.3539521</td><td>-0.02076399</td><td>-0.8921321</td></tr>\n",
       "\t<tr><td>2.300160</td><td> 1.2499939</td><td>-0.27022512</td><td>-0.5745158</td><td>-0.05554790</td><td>1.5541353</td><td>1.6379388</td><td>-0.3341408</td><td>-0.65202186</td><td> 0.3990091</td></tr>\n",
       "\t<tr><td>2.075320</td><td>-0.2856476</td><td>-0.69312560</td><td> 0.6953434</td><td>-1.09722619</td><td>0.7493207</td><td>0.7902529</td><td> 1.0504149</td><td>-0.37832963</td><td>-0.4594624</td></tr>\n",
       "\t<tr><td>2.653480</td><td>-1.5265008</td><td>-0.81048034</td><td> 0.8040882</td><td>-1.11928630</td><td>0.0938905</td><td>0.1773350</td><td> 0.7814916</td><td>-1.89246565</td><td>-0.5281402</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A tibble: 6 × 10\n",
       "\\begin{tabular}{llllllllll}\n",
       " Stunting & AHH & PDRB & Miskin & Pengeluaran & Angkatan\\_Kerja & Penduduk\\_Bekerja & TPAK & TPT & RLS\\\\\n",
       " <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}> & <dbl{[},1{]}>\\\\\n",
       "\\hline\n",
       "\t 2.284100 & -0.3610586 &  0.07668246 & -0.2482812 &  0.06445909 & 3.3852035 & 3.3334472 & -0.3048521 &  0.96364514 & -0.1092061\\\\\n",
       "\t 2.701660 & -0.4501806 & -0.58662698 & -0.3850893 & -0.66352447 & 0.7216528 & 0.7576109 &  1.1223053 & -0.30328499 & -0.9539420\\\\\n",
       "\t 0.469319 & -1.0946016 & -0.82345342 &  0.7409461 & -1.08972575 & 0.5680462 & 0.5856078 &  1.3539521 & -0.02076399 & -0.8921321\\\\\n",
       "\t 2.300160 &  1.2499939 & -0.27022512 & -0.5745158 & -0.05554790 & 1.5541353 & 1.6379388 & -0.3341408 & -0.65202186 &  0.3990091\\\\\n",
       "\t 2.075320 & -0.2856476 & -0.69312560 &  0.6953434 & -1.09722619 & 0.7493207 & 0.7902529 &  1.0504149 & -0.37832963 & -0.4594624\\\\\n",
       "\t 2.653480 & -1.5265008 & -0.81048034 &  0.8040882 & -1.11928630 & 0.0938905 & 0.1773350 &  0.7814916 & -1.89246565 & -0.5281402\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A tibble: 6 × 10\n",
       "\n",
       "| Stunting &lt;dbl[,1]&gt; | AHH &lt;dbl[,1]&gt; | PDRB &lt;dbl[,1]&gt; | Miskin &lt;dbl[,1]&gt; | Pengeluaran &lt;dbl[,1]&gt; | Angkatan_Kerja &lt;dbl[,1]&gt; | Penduduk_Bekerja &lt;dbl[,1]&gt; | TPAK &lt;dbl[,1]&gt; | TPT &lt;dbl[,1]&gt; | RLS &lt;dbl[,1]&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 2.284100 | -0.3610586 |  0.07668246 | -0.2482812 |  0.06445909 | 3.3852035 | 3.3334472 | -0.3048521 |  0.96364514 | -0.1092061 |\n",
       "| 2.701660 | -0.4501806 | -0.58662698 | -0.3850893 | -0.66352447 | 0.7216528 | 0.7576109 |  1.1223053 | -0.30328499 | -0.9539420 |\n",
       "| 0.469319 | -1.0946016 | -0.82345342 |  0.7409461 | -1.08972575 | 0.5680462 | 0.5856078 |  1.3539521 | -0.02076399 | -0.8921321 |\n",
       "| 2.300160 |  1.2499939 | -0.27022512 | -0.5745158 | -0.05554790 | 1.5541353 | 1.6379388 | -0.3341408 | -0.65202186 |  0.3990091 |\n",
       "| 2.075320 | -0.2856476 | -0.69312560 |  0.6953434 | -1.09722619 | 0.7493207 | 0.7902529 |  1.0504149 | -0.37832963 | -0.4594624 |\n",
       "| 2.653480 | -1.5265008 | -0.81048034 |  0.8040882 | -1.11928630 | 0.0938905 | 0.1773350 |  0.7814916 | -1.89246565 | -0.5281402 |\n",
       "\n"
      ],
      "text/plain": [
       "  Stunting AHH        PDRB        Miskin     Pengeluaran Angkatan_Kerja\n",
       "1 2.284100 -0.3610586  0.07668246 -0.2482812  0.06445909 3.3852035     \n",
       "2 2.701660 -0.4501806 -0.58662698 -0.3850893 -0.66352447 0.7216528     \n",
       "3 0.469319 -1.0946016 -0.82345342  0.7409461 -1.08972575 0.5680462     \n",
       "4 2.300160  1.2499939 -0.27022512 -0.5745158 -0.05554790 1.5541353     \n",
       "5 2.075320 -0.2856476 -0.69312560  0.6953434 -1.09722619 0.7493207     \n",
       "6 2.653480 -1.5265008 -0.81048034  0.8040882 -1.11928630 0.0938905     \n",
       "  Penduduk_Bekerja TPAK       TPT         RLS       \n",
       "1 3.3334472        -0.3048521  0.96364514 -0.1092061\n",
       "2 0.7576109         1.1223053 -0.30328499 -0.9539420\n",
       "3 0.5856078         1.3539521 -0.02076399 -0.8921321\n",
       "4 1.6379388        -0.3341408 -0.65202186  0.3990091\n",
       "5 0.7902529         1.0504149 -0.37832963 -0.4594624\n",
       "6 0.1773350         0.7814916 -1.89246565 -0.5281402"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Tanpa Daerah & Tahun\n",
    "data3 = data2[-c(1, 2)]\n",
    "head(data3)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "b102c76a",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:07.139694Z",
     "iopub.status.busy": "2023-05-14T08:05:07.137712Z",
     "iopub.status.idle": "2023-05-14T08:05:07.180220Z",
     "shell.execute_reply": "2023-05-14T08:05:07.178599Z"
    },
    "papermill": {
     "duration": 0.065847,
     "end_time": "2023-05-14T08:05:07.182280",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.116433",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = TPT ~ ., data = data3)\n",
       "\n",
       "Residuals:\n",
       "     Min       1Q   Median       3Q      Max \n",
       "-1.45079 -0.27987 -0.00366  0.25941  1.39910 \n",
       "\n",
       "Coefficients:\n",
       "                   Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept)      -1.850e-15  3.729e-02   0.000  1.00000    \n",
       "Stunting         -1.713e-02  4.014e-02  -0.427  0.67020    \n",
       "AHH               2.701e-01  6.457e-02   4.184 4.83e-05 ***\n",
       "PDRB              1.243e-01  4.712e-02   2.637  0.00922 ** \n",
       "Miskin            1.000e-01  6.417e-02   1.558  0.12121    \n",
       "Pengeluaran      -9.881e-03  7.613e-02  -0.130  0.89690    \n",
       "Angkatan_Kerja    1.488e+01  9.968e-01  14.932  < 2e-16 ***\n",
       "Penduduk_Bekerja -1.472e+01  9.979e-01 -14.746  < 2e-16 ***\n",
       "TPAK             -3.581e-01  4.027e-02  -8.891 1.64e-15 ***\n",
       "RLS              -9.182e-02  8.011e-02  -1.146  0.25352    \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 0.4746 on 152 degrees of freedom\n",
       "Multiple R-squared:  0.7873,\tAdjusted R-squared:  0.7747 \n",
       "F-statistic: 62.53 on 9 and 152 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Model 1\n",
    "lm1 = lm(TPT~., data=data3)\n",
    "summary(lm1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "232b9b8c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:07.221478Z",
     "iopub.status.busy": "2023-05-14T08:05:07.220334Z",
     "iopub.status.idle": "2023-05-14T08:05:07.238714Z",
     "shell.execute_reply": "2023-05-14T08:05:07.237105Z"
    },
    "papermill": {
     "duration": 0.040268,
     "end_time": "2023-05-14T08:05:07.240896",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.200628",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = TPT ~ . - Pengeluaran, data = data3)\n",
       "\n",
       "Residuals:\n",
       "     Min       1Q   Median       3Q      Max \n",
       "-1.44988 -0.28028 -0.00303  0.25604  1.40578 \n",
       "\n",
       "Coefficients:\n",
       "                   Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept)      -1.849e-15  3.717e-02   0.000  1.00000    \n",
       "Stunting         -1.681e-02  3.994e-02  -0.421  0.67442    \n",
       "AHH               2.671e-01  5.993e-02   4.457 1.60e-05 ***\n",
       "PDRB              1.221e-01  4.373e-02   2.791  0.00592 ** \n",
       "Miskin            1.020e-01  6.215e-02   1.640  0.10296    \n",
       "Angkatan_Kerja    1.488e+01  9.933e-01  14.982  < 2e-16 ***\n",
       "Penduduk_Bekerja -1.471e+01  9.944e-01 -14.795  < 2e-16 ***\n",
       "TPAK             -3.588e-01  3.971e-02  -9.036 6.68e-16 ***\n",
       "RLS              -9.513e-02  7.569e-02  -1.257  0.21074    \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 0.4731 on 153 degrees of freedom\n",
       "Multiple R-squared:  0.7873,\tAdjusted R-squared:  0.7762 \n",
       "F-statistic:  70.8 on 8 and 153 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Model 2\n",
    "lm2 = lm(TPT~.-Pengeluaran, data=data3)\n",
    "summary(lm2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "24dd129d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:07.279836Z",
     "iopub.status.busy": "2023-05-14T08:05:07.278665Z",
     "iopub.status.idle": "2023-05-14T08:05:07.297457Z",
     "shell.execute_reply": "2023-05-14T08:05:07.295783Z"
    },
    "papermill": {
     "duration": 0.040589,
     "end_time": "2023-05-14T08:05:07.299613",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.259024",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = TPT ~ . - Pengeluaran - Stunting, data = data3)\n",
       "\n",
       "Residuals:\n",
       "     Min       1Q   Median       3Q      Max \n",
       "-1.46249 -0.27906 -0.00402  0.26874  1.39966 \n",
       "\n",
       "Coefficients:\n",
       "                   Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept)      -1.855e-15  3.707e-02   0.000  1.00000    \n",
       "AHH               2.677e-01  5.975e-02   4.480 1.44e-05 ***\n",
       "PDRB              1.215e-01  4.359e-02   2.788  0.00597 ** \n",
       "Miskin            9.339e-02  5.857e-02   1.595  0.11285    \n",
       "Angkatan_Kerja    1.493e+01  9.844e-01  15.165  < 2e-16 ***\n",
       "Penduduk_Bekerja -1.476e+01  9.851e-01 -14.985  < 2e-16 ***\n",
       "TPAK             -3.611e-01  3.922e-02  -9.207 2.30e-16 ***\n",
       "RLS              -1.020e-01  7.374e-02  -1.383  0.16875    \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 0.4718 on 154 degrees of freedom\n",
       "Multiple R-squared:  0.7871,\tAdjusted R-squared:  0.7774 \n",
       "F-statistic: 81.32 on 7 and 154 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Model 3\n",
    "lm3 = lm(TPT~.-Pengeluaran-Stunting, data=data3)\n",
    "summary(lm3)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "0f6de076",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:07.339412Z",
     "iopub.status.busy": "2023-05-14T08:05:07.338290Z",
     "iopub.status.idle": "2023-05-14T08:05:07.359981Z",
     "shell.execute_reply": "2023-05-14T08:05:07.358325Z"
    },
    "papermill": {
     "duration": 0.043598,
     "end_time": "2023-05-14T08:05:07.362154",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.318556",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "Call:\n",
       "lm(formula = TPT ~ . - Pengeluaran - Stunting - RLS, data = data3)\n",
       "\n",
       "Residuals:\n",
       "     Min       1Q   Median       3Q      Max \n",
       "-1.50509 -0.26504  0.00183  0.30076  1.38747 \n",
       "\n",
       "Coefficients:\n",
       "                   Estimate Std. Error t value Pr(>|t|)    \n",
       "(Intercept)      -1.792e-15  3.718e-02   0.000  1.00000    \n",
       "AHH               2.151e-01  4.622e-02   4.655 6.92e-06 ***\n",
       "PDRB              1.203e-01  4.371e-02   2.752  0.00663 ** \n",
       "Miskin            1.412e-01  4.741e-02   2.978  0.00337 ** \n",
       "Angkatan_Kerja    1.477e+01  9.810e-01  15.061  < 2e-16 ***\n",
       "Penduduk_Bekerja -1.458e+01  9.794e-01 -14.889  < 2e-16 ***\n",
       "TPAK             -3.547e-01  3.906e-02  -9.081 4.71e-16 ***\n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Residual standard error: 0.4732 on 155 degrees of freedom\n",
       "Multiple R-squared:  0.7844,\tAdjusted R-squared:  0.7761 \n",
       "F-statistic:    94 on 6 and 155 DF,  p-value: < 2.2e-16\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Model 4\n",
    "lm4 = lm(TPT~.-Pengeluaran-Stunting-RLS, data=data3)\n",
    "summary(lm4)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "6aeef181",
   "metadata": {
    "papermill": {
     "duration": 0.018374,
     "end_time": "2023-05-14T08:05:07.399065",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.380691",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> # Haussman Test<br>\n",
    "H0: Model REM yang sesuai<br>\n",
    "H1: Model FEM yang sesuai"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "016d0a0b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:07.438225Z",
     "iopub.status.busy": "2023-05-14T08:05:07.436896Z",
     "iopub.status.idle": "2023-05-14T08:05:07.451000Z",
     "shell.execute_reply": "2023-05-14T08:05:07.449371Z"
    },
    "papermill": {
     "duration": 0.036122,
     "end_time": "2023-05-14T08:05:07.453494",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.417372",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Stunting'</li><li>'AHH'</li><li>'PDRB'</li><li>'Miskin'</li><li>'Pengeluaran'</li><li>'Angkatan_Kerja'</li><li>'Penduduk_Bekerja'</li><li>'TPAK'</li><li>'RLS'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Stunting'\n",
       "\\item 'AHH'\n",
       "\\item 'PDRB'\n",
       "\\item 'Miskin'\n",
       "\\item 'Pengeluaran'\n",
       "\\item 'Angkatan\\_Kerja'\n",
       "\\item 'Penduduk\\_Bekerja'\n",
       "\\item 'TPAK'\n",
       "\\item 'RLS'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Stunting'\n",
       "2. 'AHH'\n",
       "3. 'PDRB'\n",
       "4. 'Miskin'\n",
       "5. 'Pengeluaran'\n",
       "6. 'Angkatan_Kerja'\n",
       "7. 'Penduduk_Bekerja'\n",
       "8. 'TPAK'\n",
       "9. 'RLS'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Stunting\"         \"AHH\"              \"PDRB\"             \"Miskin\"          \n",
       "[5] \"Pengeluaran\"      \"Angkatan_Kerja\"   \"Penduduk_Bekerja\" \"TPAK\"            \n",
       "[9] \"RLS\"             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "names(lm1$coefficients)[-1]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "5656a6fd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:07.494482Z",
     "iopub.status.busy": "2023-05-14T08:05:07.492832Z",
     "iopub.status.idle": "2023-05-14T08:05:07.563728Z",
     "shell.execute_reply": "2023-05-14T08:05:07.561801Z"
    },
    "papermill": {
     "duration": 0.093952,
     "end_time": "2023-05-14T08:05:07.566439",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.472487",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tHausman Test\n",
       "\n",
       "data:  TPT ~ Stunting + AHH + PDRB + Miskin + Pengeluaran + Angkatan_Kerja +  ...\n",
       "chisq = 24.922, df = 9, p-value = 0.003059\n",
       "alternative hypothesis: one model is inconsistent\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "gf1 = plm(TPT~Stunting+AHH+PDRB+Miskin+Pengeluaran+Angkatan_Kerja+Penduduk_Bekerja+TPAK+RLS, data = data2, model = \"within\", index=c(\"Daerah\",\"Tahun\"))\n",
    "gr1 = plm(TPT~Stunting+AHH+PDRB+Miskin+Pengeluaran+Angkatan_Kerja+Penduduk_Bekerja+TPAK+RLS, data = data2, model = \"random\", index=c(\"Daerah\",\"Tahun\"))\n",
    "phtest(gf1, gr1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "83b46519",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:07.621775Z",
     "iopub.status.busy": "2023-05-14T08:05:07.620188Z",
     "iopub.status.idle": "2023-05-14T08:05:07.680595Z",
     "shell.execute_reply": "2023-05-14T08:05:07.678086Z"
    },
    "papermill": {
     "duration": 0.090125,
     "end_time": "2023-05-14T08:05:07.682793",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.592668",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tHausman Test\n",
       "\n",
       "data:  TPT ~ Stunting + AHH + PDRB + Miskin + Angkatan_Kerja + Penduduk_Bekerja +  ...\n",
       "chisq = 26.889, df = 8, p-value = 0.0007388\n",
       "alternative hypothesis: one model is inconsistent\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "gf2 = plm(TPT~Stunting+AHH+PDRB+Miskin+Angkatan_Kerja+Penduduk_Bekerja+TPAK+RLS, data = data2, model = \"within\", index=c(\"Daerah\",\"Tahun\"))\n",
    "gr2 = plm(TPT~Stunting+AHH+PDRB+Miskin+Angkatan_Kerja+Penduduk_Bekerja+TPAK+RLS, data = data2, model = \"random\", index=c(\"Daerah\",\"Tahun\"))\n",
    "phtest(gf2, gr2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "12704b03",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:07.739063Z",
     "iopub.status.busy": "2023-05-14T08:05:07.737474Z",
     "iopub.status.idle": "2023-05-14T08:05:07.797372Z",
     "shell.execute_reply": "2023-05-14T08:05:07.794817Z"
    },
    "papermill": {
     "duration": 0.09056,
     "end_time": "2023-05-14T08:05:07.799698",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.709138",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tHausman Test\n",
       "\n",
       "data:  TPT ~ AHH + PDRB + Miskin + Angkatan_Kerja + Penduduk_Bekerja +  ...\n",
       "chisq = 20.108, df = 7, p-value = 0.005341\n",
       "alternative hypothesis: one model is inconsistent\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "gf3 = plm(TPT~AHH+PDRB+Miskin+Angkatan_Kerja+Penduduk_Bekerja+TPAK+RLS, data = data2, model = \"within\", index=c(\"Daerah\",\"Tahun\"))\n",
    "gr3 = plm(TPT~AHH+PDRB+Miskin+Angkatan_Kerja+Penduduk_Bekerja+TPAK+RLS, data = data2, model = \"random\", index=c(\"Daerah\",\"Tahun\"))\n",
    "phtest(gf3, gr3)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "e3eed777",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:07.856237Z",
     "iopub.status.busy": "2023-05-14T08:05:07.854722Z",
     "iopub.status.idle": "2023-05-14T08:05:07.922706Z",
     "shell.execute_reply": "2023-05-14T08:05:07.920160Z"
    },
    "papermill": {
     "duration": 0.098097,
     "end_time": "2023-05-14T08:05:07.924858",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.826761",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tHausman Test\n",
       "\n",
       "data:  TPT ~ AHH + PDRB + Miskin + Angkatan_Kerja + Penduduk_Bekerja +  ...\n",
       "chisq = 15.762, df = 6, p-value = 0.01509\n",
       "alternative hypothesis: one model is inconsistent\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "gf4 = plm(TPT~AHH+PDRB+Miskin+Angkatan_Kerja+Penduduk_Bekerja+TPAK, data = data2, model = \"within\", index=c(\"Daerah\",\"Tahun\"))\n",
    "gr4 = plm(TPT~AHH+PDRB+Miskin+Angkatan_Kerja+Penduduk_Bekerja+TPAK, data = data2, model = \"random\", index=c(\"Daerah\",\"Tahun\"))\n",
    "phtest(gf4, gr4)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "643ec8ab",
   "metadata": {
    "papermill": {
     "duration": 0.025885,
     "end_time": "2023-05-14T08:05:07.977241",
     "exception": false,
     "start_time": "2023-05-14T08:05:07.951356",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> # Chow Test<br>\n",
    "H0: Model CEM yang sesuai<br>\n",
    "H1: Model FEM yang sesuai"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "2ed15c96",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.032112Z",
     "iopub.status.busy": "2023-05-14T08:05:08.030599Z",
     "iopub.status.idle": "2023-05-14T08:05:08.051353Z",
     "shell.execute_reply": "2023-05-14T08:05:08.050186Z"
    },
    "papermill": {
     "duration": 0.049701,
     "end_time": "2023-05-14T08:05:08.052890",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.003189",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tF test for individual effects\n",
       "\n",
       "data:  TPT ~ Stunting + AHH + PDRB + Miskin + Pengeluaran + Angkatan_Kerja +  ...\n",
       "F = 7.6509, df1 = 26, df2 = 126, p-value = 9.892e-16\n",
       "alternative hypothesis: significant effects\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "gc1 = plm(TPT~Stunting+AHH+PDRB+Miskin+Pengeluaran+Angkatan_Kerja+Penduduk_Bekerja+TPAK+RLS, data = data2, model = \"pooling\", index=c(\"Daerah\",\"Tahun\"))\n",
    "pFtest(gf1, gc1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "258146bd",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.095804Z",
     "iopub.status.busy": "2023-05-14T08:05:08.094677Z",
     "iopub.status.idle": "2023-05-14T08:05:08.114344Z",
     "shell.execute_reply": "2023-05-14T08:05:08.113147Z"
    },
    "papermill": {
     "duration": 0.042429,
     "end_time": "2023-05-14T08:05:08.115984",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.073555",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tF test for individual effects\n",
       "\n",
       "data:  TPT ~ Stunting + AHH + PDRB + Miskin + Angkatan_Kerja + Penduduk_Bekerja +  ...\n",
       "F = 7.7129, df1 = 26, df2 = 127, p-value = 6.67e-16\n",
       "alternative hypothesis: significant effects\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "gc2 = plm(TPT~Stunting+AHH+PDRB+Miskin+Angkatan_Kerja+Penduduk_Bekerja+TPAK+RLS, data = data2, model = \"pooling\", index=c(\"Daerah\",\"Tahun\"))\n",
    "pFtest(gf2, gc2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "0945a0fb",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.157957Z",
     "iopub.status.busy": "2023-05-14T08:05:08.156634Z",
     "iopub.status.idle": "2023-05-14T08:05:08.178610Z",
     "shell.execute_reply": "2023-05-14T08:05:08.177318Z"
    },
    "papermill": {
     "duration": 0.044663,
     "end_time": "2023-05-14T08:05:08.180242",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.135579",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tF test for individual effects\n",
       "\n",
       "data:  TPT ~ AHH + PDRB + Miskin + Angkatan_Kerja + Penduduk_Bekerja +  ...\n",
       "F = 6.9214, df1 = 26, df2 = 128, p-value = 2.239e-14\n",
       "alternative hypothesis: significant effects\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "gc3 = plm(TPT~AHH+PDRB+Miskin+Angkatan_Kerja+Penduduk_Bekerja+TPAK+RLS, data = data2, model = \"pooling\", index=c(\"Daerah\",\"Tahun\"))\n",
    "pFtest(gf3, gc3)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "79a1c413",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.222219Z",
     "iopub.status.busy": "2023-05-14T08:05:08.221011Z",
     "iopub.status.idle": "2023-05-14T08:05:08.241346Z",
     "shell.execute_reply": "2023-05-14T08:05:08.240096Z"
    },
    "papermill": {
     "duration": 0.043176,
     "end_time": "2023-05-14T08:05:08.243009",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.199833",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tF test for individual effects\n",
       "\n",
       "data:  TPT ~ AHH + PDRB + Miskin + Angkatan_Kerja + Penduduk_Bekerja +  ...\n",
       "F = 6.8751, df1 = 26, df2 = 129, p-value = 2.522e-14\n",
       "alternative hypothesis: significant effects\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "gc4 = plm(TPT~AHH+PDRB+Miskin+Angkatan_Kerja+Penduduk_Bekerja+TPAK, data = data2, model = \"pooling\", index=c(\"Daerah\",\"Tahun\"))\n",
    "pFtest(gf4, gc4)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "643b108e",
   "metadata": {
    "papermill": {
     "duration": 0.019606,
     "end_time": "2023-05-14T08:05:08.282324",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.262718",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> # Diagnostic"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "09586f38",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.324110Z",
     "iopub.status.busy": "2023-05-14T08:05:08.322824Z",
     "iopub.status.idle": "2023-05-14T08:05:08.339872Z",
     "shell.execute_reply": "2023-05-14T08:05:08.338696Z"
    },
    "papermill": {
     "duration": 0.039764,
     "end_time": "2023-05-14T08:05:08.341459",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.301695",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tBreusch-Godfrey/Wooldridge test for serial correlation in panel models\n",
       "\n",
       "data:  TPT ~ Stunting + AHH + PDRB + Miskin + Pengeluaran + Angkatan_Kerja +  ...\n",
       "chisq = 25.884, df = 2, p-value = 2.395e-06\n",
       "alternative hypothesis: serial correlation in idiosyncratic errors\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pbgtest(gf1,order=2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "id": "85c70e12",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.383351Z",
     "iopub.status.busy": "2023-05-14T08:05:08.382150Z",
     "iopub.status.idle": "2023-05-14T08:05:08.400476Z",
     "shell.execute_reply": "2023-05-14T08:05:08.398989Z"
    },
    "papermill": {
     "duration": 0.041733,
     "end_time": "2023-05-14T08:05:08.402683",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.360950",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tBreusch-Godfrey/Wooldridge test for serial correlation in panel models\n",
       "\n",
       "data:  TPT ~ Stunting + AHH + PDRB + Miskin + Angkatan_Kerja + Penduduk_Bekerja +  ...\n",
       "chisq = 25.947, df = 2, p-value = 2.321e-06\n",
       "alternative hypothesis: serial correlation in idiosyncratic errors\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pbgtest(gf2,order=2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "id": "426701d8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.444407Z",
     "iopub.status.busy": "2023-05-14T08:05:08.443292Z",
     "iopub.status.idle": "2023-05-14T08:05:08.460366Z",
     "shell.execute_reply": "2023-05-14T08:05:08.459130Z"
    },
    "papermill": {
     "duration": 0.040332,
     "end_time": "2023-05-14T08:05:08.462202",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.421870",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tBreusch-Godfrey/Wooldridge test for serial correlation in panel models\n",
       "\n",
       "data:  TPT ~ AHH + PDRB + Miskin + Angkatan_Kerja + Penduduk_Bekerja +  ...\n",
       "chisq = 30.013, df = 2, p-value = 3.04e-07\n",
       "alternative hypothesis: serial correlation in idiosyncratic errors\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pbgtest(gf3,order=2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "id": "b5b78aa3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.507417Z",
     "iopub.status.busy": "2023-05-14T08:05:08.506163Z",
     "iopub.status.idle": "2023-05-14T08:05:08.523293Z",
     "shell.execute_reply": "2023-05-14T08:05:08.521820Z"
    },
    "papermill": {
     "duration": 0.04079,
     "end_time": "2023-05-14T08:05:08.525147",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.484357",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tBreusch-Godfrey/Wooldridge test for serial correlation in panel models\n",
       "\n",
       "data:  TPT ~ AHH + PDRB + Miskin + Angkatan_Kerja + Penduduk_Bekerja +  ...\n",
       "chisq = 31.63, df = 2, p-value = 1.354e-07\n",
       "alternative hypothesis: serial correlation in idiosyncratic errors\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pbgtest(gf4,order=2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 37,
   "id": "0c0412a0",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.568317Z",
     "iopub.status.busy": "2023-05-14T08:05:08.566648Z",
     "iopub.status.idle": "2023-05-14T08:05:08.581089Z",
     "shell.execute_reply": "2023-05-14T08:05:08.579931Z"
    },
    "papermill": {
     "duration": 0.037323,
     "end_time": "2023-05-14T08:05:08.582711",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.545388",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tstudentized Breusch-Pagan test\n",
       "\n",
       "data:  gf1\n",
       "BP = 37.871, df = 9, p-value = 1.838e-05\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bptest(gf1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "id": "a33a6433",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.624654Z",
     "iopub.status.busy": "2023-05-14T08:05:08.623657Z",
     "iopub.status.idle": "2023-05-14T08:05:08.636123Z",
     "shell.execute_reply": "2023-05-14T08:05:08.634994Z"
    },
    "papermill": {
     "duration": 0.035018,
     "end_time": "2023-05-14T08:05:08.637702",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.602684",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tstudentized Breusch-Pagan test\n",
       "\n",
       "data:  gf2\n",
       "BP = 32.153, df = 8, p-value = 8.745e-05\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bptest(gf2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 39,
   "id": "67fa5ff6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.679556Z",
     "iopub.status.busy": "2023-05-14T08:05:08.678542Z",
     "iopub.status.idle": "2023-05-14T08:05:08.696913Z",
     "shell.execute_reply": "2023-05-14T08:05:08.695722Z"
    },
    "papermill": {
     "duration": 0.040877,
     "end_time": "2023-05-14T08:05:08.698490",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.657613",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tstudentized Breusch-Pagan test\n",
       "\n",
       "data:  gf3\n",
       "BP = 32.365, df = 7, p-value = 3.474e-05\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bptest(gf3)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 40,
   "id": "72a85004",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.741115Z",
     "iopub.status.busy": "2023-05-14T08:05:08.740077Z",
     "iopub.status.idle": "2023-05-14T08:05:08.752797Z",
     "shell.execute_reply": "2023-05-14T08:05:08.751617Z"
    },
    "papermill": {
     "duration": 0.036208,
     "end_time": "2023-05-14T08:05:08.754794",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.718586",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "\n",
       "\tstudentized Breusch-Pagan test\n",
       "\n",
       "data:  gf4\n",
       "BP = 33.745, df = 6, p-value = 7.533e-06\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "bptest(gf4)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "id": "4e582549",
   "metadata": {
    "papermill": {
     "duration": 0.019483,
     "end_time": "2023-05-14T08:05:08.794259",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.774776",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": []
  },
  {
   "cell_type": "markdown",
   "id": "84408270",
   "metadata": {
    "papermill": {
     "duration": 0.019435,
     "end_time": "2023-05-14T08:05:08.833386",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.813951",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> # Model Terbaik"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 41,
   "id": "f33bec56",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.875221Z",
     "iopub.status.busy": "2023-05-14T08:05:08.874059Z",
     "iopub.status.idle": "2023-05-14T08:05:08.929144Z",
     "shell.execute_reply": "2023-05-14T08:05:08.927896Z"
    },
    "papermill": {
     "duration": 0.077943,
     "end_time": "2023-05-14T08:05:08.930808",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.852865",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Oneway (individual) effect Within Model\n",
       "\n",
       "Call:\n",
       "plm(formula = TPT ~ Stunting + AHH + PDRB + Miskin + Pengeluaran + \n",
       "    Angkatan_Kerja + Penduduk_Bekerja + TPAK + RLS, data = data2, \n",
       "    model = \"within\", index = c(\"Daerah\", \"Tahun\"))\n",
       "\n",
       "Balanced Panel: n = 27, T = 6, N = 162\n",
       "\n",
       "Residuals:\n",
       "       Min.     1st Qu.      Median     3rd Qu.        Max. \n",
       "-0.96884029 -0.14641940 -0.00062413  0.11270468  0.99573310 \n",
       "\n",
       "Coefficients:\n",
       "                   Estimate Std. Error  t-value  Pr(>|t|)    \n",
       "Stunting          -0.101685   0.033556  -3.0303  0.002965 ** \n",
       "AHH                0.726292   0.338352   2.1466  0.033745 *  \n",
       "PDRB               0.277347   0.348516   0.7958  0.427648    \n",
       "Miskin             0.175853   0.188711   0.9319  0.353189    \n",
       "Pengeluaran        0.018504   0.511980   0.0361  0.971226    \n",
       "Angkatan_Kerja    14.617972   1.214405  12.0371 < 2.2e-16 ***\n",
       "Penduduk_Bekerja -14.570393   1.104266 -13.1946 < 2.2e-16 ***\n",
       "TPAK              -0.084391   0.072201  -1.1688  0.244673    \n",
       "RLS               -0.748990   0.424679  -1.7637  0.080213 .  \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Total Sum of Squares:    42.016\n",
       "Residual Sum of Squares: 13.277\n",
       "R-Squared:      0.684\n",
       "Adj. R-Squared: 0.59622\n",
       "F-statistic: 30.3039 on 9 and 126 DF, p-value: < 2.22e-16"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "Oneway (individual) effect Within Model\n",
       "\n",
       "Call:\n",
       "plm(formula = TPT ~ Stunting + AHH + PDRB + Miskin + Angkatan_Kerja + \n",
       "    Penduduk_Bekerja + TPAK + RLS, data = data2, model = \"within\", \n",
       "    index = c(\"Daerah\", \"Tahun\"))\n",
       "\n",
       "Balanced Panel: n = 27, T = 6, N = 162\n",
       "\n",
       "Residuals:\n",
       "       Min.     1st Qu.      Median     3rd Qu.        Max. \n",
       "-0.96790747 -0.14674742 -0.00063912  0.11226767  0.99524574 \n",
       "\n",
       "Coefficients:\n",
       "                   Estimate Std. Error  t-value  Pr(>|t|)    \n",
       "Stunting          -0.101591   0.033323  -3.0487  0.002797 ** \n",
       "AHH                0.734889   0.239696   3.0659  0.002652 ** \n",
       "PDRB               0.282830   0.312543   0.9049  0.367217    \n",
       "Miskin             0.170488   0.116077   1.4687  0.144375    \n",
       "Angkatan_Kerja    14.604769   1.153595  12.6602 < 2.2e-16 ***\n",
       "Penduduk_Bekerja -14.557627   1.042133 -13.9691 < 2.2e-16 ***\n",
       "TPAK              -0.084221   0.071763  -1.1736  0.242751    \n",
       "RLS               -0.749878   0.422298  -1.7757  0.078176 .  \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Total Sum of Squares:    42.016\n",
       "Residual Sum of Squares: 13.277\n",
       "R-Squared:      0.684\n",
       "Adj. R-Squared: 0.5994\n",
       "F-statistic: 34.3619 on 8 and 127 DF, p-value: < 2.22e-16"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "Oneway (individual) effect Within Model\n",
       "\n",
       "Call:\n",
       "plm(formula = TPT ~ AHH + PDRB + Miskin + Angkatan_Kerja + Penduduk_Bekerja + \n",
       "    TPAK + RLS, data = data2, model = \"within\", index = c(\"Daerah\", \n",
       "    \"Tahun\"))\n",
       "\n",
       "Balanced Panel: n = 27, T = 6, N = 162\n",
       "\n",
       "Residuals:\n",
       "     Min.   1st Qu.    Median   3rd Qu.      Max. \n",
       "-1.064592 -0.140400 -0.005914  0.126001  1.007212 \n",
       "\n",
       "Coefficients:\n",
       "                   Estimate Std. Error  t-value Pr(>|t|)    \n",
       "AHH                0.554768   0.239709   2.3143  0.02224 *  \n",
       "PDRB               0.143708   0.319055   0.4504  0.65317    \n",
       "Miskin             0.107241   0.117851   0.9100  0.36455    \n",
       "Angkatan_Kerja    15.113760   1.177853  12.8316  < 2e-16 ***\n",
       "Penduduk_Bekerja -14.988077   1.065454 -14.0673  < 2e-16 ***\n",
       "TPAK              -0.089992   0.074026  -1.2157  0.22634    \n",
       "RLS               -0.714201   0.435598  -1.6396  0.10355    \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Total Sum of Squares:    42.016\n",
       "Residual Sum of Squares: 14.249\n",
       "R-Squared:      0.66087\n",
       "Adj. R-Squared: 0.57344\n",
       "F-statistic: 35.6339 on 7 and 128 DF, p-value: < 2.22e-16"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "Oneway (individual) effect Within Model\n",
       "\n",
       "Call:\n",
       "plm(formula = TPT ~ AHH + PDRB + Miskin + Angkatan_Kerja + Penduduk_Bekerja + \n",
       "    TPAK, data = data2, model = \"within\", index = c(\"Daerah\", \n",
       "    \"Tahun\"))\n",
       "\n",
       "Balanced Panel: n = 27, T = 6, N = 162\n",
       "\n",
       "Residuals:\n",
       "      Min.    1st Qu.     Median    3rd Qu.       Max. \n",
       "-1.0852851 -0.1150820 -0.0032427  0.1294234  1.0478578 \n",
       "\n",
       "Coefficients:\n",
       "                   Estimate Std. Error  t-value Pr(>|t|)    \n",
       "AHH                0.245094   0.148568   1.6497   0.1014    \n",
       "PDRB               0.113759   0.320609   0.3548   0.7233    \n",
       "Miskin             0.073572   0.116805   0.6299   0.5299    \n",
       "Angkatan_Kerja    14.726045   1.161398  12.6796   <2e-16 ***\n",
       "Penduduk_Bekerja -14.788637   1.065391 -13.8809   <2e-16 ***\n",
       "TPAK              -0.080422   0.074277  -1.0827   0.2809    \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Total Sum of Squares:    42.016\n",
       "Residual Sum of Squares: 14.548\n",
       "R-Squared:      0.65375\n",
       "Adj. R-Squared: 0.56786\n",
       "F-statistic: 40.5936 on 6 and 129 DF, p-value: < 2.22e-16"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(gf1)\n",
    "summary(gf2)\n",
    "summary(gf3)\n",
    "summary(gf4)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 42,
   "id": "2257396d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:08.974209Z",
     "iopub.status.busy": "2023-05-14T08:05:08.972964Z",
     "iopub.status.idle": "2023-05-14T08:05:08.994207Z",
     "shell.execute_reply": "2023-05-14T08:05:08.992946Z"
    },
    "papermill": {
     "duration": 0.044682,
     "end_time": "2023-05-14T08:05:08.996012",
     "exception": false,
     "start_time": "2023-05-14T08:05:08.951330",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Oneway (individual) effect Within Model\n",
       "\n",
       "Call:\n",
       "plm(formula = TPT ~ Stunting + AHH + PDRB + Miskin + Angkatan_Kerja + \n",
       "    Penduduk_Bekerja + TPAK + RLS, data = data2, model = \"within\", \n",
       "    index = c(\"Daerah\", \"Tahun\"))\n",
       "\n",
       "Balanced Panel: n = 27, T = 6, N = 162\n",
       "\n",
       "Residuals:\n",
       "       Min.     1st Qu.      Median     3rd Qu.        Max. \n",
       "-0.96790747 -0.14674742 -0.00063912  0.11226767  0.99524574 \n",
       "\n",
       "Coefficients:\n",
       "                   Estimate Std. Error  t-value  Pr(>|t|)    \n",
       "Stunting          -0.101591   0.033323  -3.0487  0.002797 ** \n",
       "AHH                0.734889   0.239696   3.0659  0.002652 ** \n",
       "PDRB               0.282830   0.312543   0.9049  0.367217    \n",
       "Miskin             0.170488   0.116077   1.4687  0.144375    \n",
       "Angkatan_Kerja    14.604769   1.153595  12.6602 < 2.2e-16 ***\n",
       "Penduduk_Bekerja -14.557627   1.042133 -13.9691 < 2.2e-16 ***\n",
       "TPAK              -0.084221   0.071763  -1.1736  0.242751    \n",
       "RLS               -0.749878   0.422298  -1.7757  0.078176 .  \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Total Sum of Squares:    42.016\n",
       "Residual Sum of Squares: 13.277\n",
       "R-Squared:      0.684\n",
       "Adj. R-Squared: 0.5994\n",
       "F-statistic: 34.3619 on 8 and 127 DF, p-value: < 2.22e-16"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(gf2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 43,
   "id": "688be1d9",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:09.040348Z",
     "iopub.status.busy": "2023-05-14T08:05:09.039083Z",
     "iopub.status.idle": "2023-05-14T08:05:09.060752Z",
     "shell.execute_reply": "2023-05-14T08:05:09.058958Z"
    },
    "papermill": {
     "duration": 0.046098,
     "end_time": "2023-05-14T08:05:09.062939",
     "exception": false,
     "start_time": "2023-05-14T08:05:09.016841",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>KABUPATEN PANGANDARAN</dt><dd>-1.51466233068232</dd><dt>KABUPATEN INDRAMAYU</dt><dd>-0.932347218046934</dd><dt>KABUPATEN KUNINGAN</dt><dd>-0.90705803651431</dd><dt>KABUPATEN CIAMIS</dt><dd>-0.795615223946498</dd><dt>KABUPATEN BEKASI</dt><dd>-0.674938565725947</dd><dt>KABUPATEN KARAWANG</dt><dd>-0.622158158576731</dd><dt>KABUPATEN SUBANG</dt><dd>-0.605347690244656</dd><dt>KABUPATEN MAJALENGKA</dt><dd>-0.5823428253425</dd><dt>KABUPATEN CIREBON</dt><dd>-0.285993138505104</dd><dt>KOTA TASIKMALAYA</dt><dd>-0.215860756437843</dd><dt>KABUPATEN SUMEDANG</dt><dd>-0.20800376996174</dd><dt>KOTA BANJAR</dt><dd>-0.113209429148347</dd><dt>KOTA BANDUNG</dt><dd>-0.0729110697149064</dd><dt>KABUPATEN BANDUNG BARAT</dt><dd>0.113399346610234</dd><dt>KABUPATEN GARUT</dt><dd>0.132645535234278</dd><dt>KABUPATEN BANDUNG</dt><dd>0.132959580657833</dd><dt>KABUPATEN SUKABUMI</dt><dd>0.290646581899753</dd><dt>KABUPATEN BOGOR</dt><dd>0.353532423699566</dd><dt>KABUPATEN PURWAKARTA</dt><dd>0.415073572965511</dd><dt>KOTA BEKASI</dt><dd>0.598963750113394</dd><dt>KOTA CIREBON</dt><dd>0.651710160852298</dd><dt>KOTA DEPOK</dt><dd>0.705765777724882</dd><dt>KOTA SUKABUMI</dt><dd>0.717968095901863</dd><dt>KABUPATEN TASIKMALAYA</dt><dd>0.753128006586565</dd><dt>KABUPATEN CIANJUR</dt><dd>0.801517478066034</dd><dt>KOTA BOGOR</dt><dd>0.899429061725706</dd><dt>KOTA CIMAHI</dt><dd>0.963708840809857</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[KABUPATEN PANGANDARAN] -1.51466233068232\n",
       "\\item[KABUPATEN INDRAMAYU] -0.932347218046934\n",
       "\\item[KABUPATEN KUNINGAN] -0.90705803651431\n",
       "\\item[KABUPATEN CIAMIS] -0.795615223946498\n",
       "\\item[KABUPATEN BEKASI] -0.674938565725947\n",
       "\\item[KABUPATEN KARAWANG] -0.622158158576731\n",
       "\\item[KABUPATEN SUBANG] -0.605347690244656\n",
       "\\item[KABUPATEN MAJALENGKA] -0.5823428253425\n",
       "\\item[KABUPATEN CIREBON] -0.285993138505104\n",
       "\\item[KOTA TASIKMALAYA] -0.215860756437843\n",
       "\\item[KABUPATEN SUMEDANG] -0.20800376996174\n",
       "\\item[KOTA BANJAR] -0.113209429148347\n",
       "\\item[KOTA BANDUNG] -0.0729110697149064\n",
       "\\item[KABUPATEN BANDUNG BARAT] 0.113399346610234\n",
       "\\item[KABUPATEN GARUT] 0.132645535234278\n",
       "\\item[KABUPATEN BANDUNG] 0.132959580657833\n",
       "\\item[KABUPATEN SUKABUMI] 0.290646581899753\n",
       "\\item[KABUPATEN BOGOR] 0.353532423699566\n",
       "\\item[KABUPATEN PURWAKARTA] 0.415073572965511\n",
       "\\item[KOTA BEKASI] 0.598963750113394\n",
       "\\item[KOTA CIREBON] 0.651710160852298\n",
       "\\item[KOTA DEPOK] 0.705765777724882\n",
       "\\item[KOTA SUKABUMI] 0.717968095901863\n",
       "\\item[KABUPATEN TASIKMALAYA] 0.753128006586565\n",
       "\\item[KABUPATEN CIANJUR] 0.801517478066034\n",
       "\\item[KOTA BOGOR] 0.899429061725706\n",
       "\\item[KOTA CIMAHI] 0.963708840809857\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "KABUPATEN PANGANDARAN\n",
       ":   -1.51466233068232KABUPATEN INDRAMAYU\n",
       ":   -0.932347218046934KABUPATEN KUNINGAN\n",
       ":   -0.90705803651431KABUPATEN CIAMIS\n",
       ":   -0.795615223946498KABUPATEN BEKASI\n",
       ":   -0.674938565725947KABUPATEN KARAWANG\n",
       ":   -0.622158158576731KABUPATEN SUBANG\n",
       ":   -0.605347690244656KABUPATEN MAJALENGKA\n",
       ":   -0.5823428253425KABUPATEN CIREBON\n",
       ":   -0.285993138505104KOTA TASIKMALAYA\n",
       ":   -0.215860756437843KABUPATEN SUMEDANG\n",
       ":   -0.20800376996174KOTA BANJAR\n",
       ":   -0.113209429148347KOTA BANDUNG\n",
       ":   -0.0729110697149064KABUPATEN BANDUNG BARAT\n",
       ":   0.113399346610234KABUPATEN GARUT\n",
       ":   0.132645535234278KABUPATEN BANDUNG\n",
       ":   0.132959580657833KABUPATEN SUKABUMI\n",
       ":   0.290646581899753KABUPATEN BOGOR\n",
       ":   0.353532423699566KABUPATEN PURWAKARTA\n",
       ":   0.415073572965511KOTA BEKASI\n",
       ":   0.598963750113394KOTA CIREBON\n",
       ":   0.651710160852298KOTA DEPOK\n",
       ":   0.705765777724882KOTA SUKABUMI\n",
       ":   0.717968095901863KABUPATEN TASIKMALAYA\n",
       ":   0.753128006586565KABUPATEN CIANJUR\n",
       ":   0.801517478066034KOTA BOGOR\n",
       ":   0.899429061725706KOTA CIMAHI\n",
       ":   0.963708840809857\n",
       "\n"
      ],
      "text/plain": [
       "  KABUPATEN PANGANDARAN     KABUPATEN INDRAMAYU      KABUPATEN KUNINGAN \n",
       "            -1.51466233             -0.93234722             -0.90705804 \n",
       "       KABUPATEN CIAMIS        KABUPATEN BEKASI      KABUPATEN KARAWANG \n",
       "            -0.79561522             -0.67493857             -0.62215816 \n",
       "       KABUPATEN SUBANG    KABUPATEN MAJALENGKA       KABUPATEN CIREBON \n",
       "            -0.60534769             -0.58234283             -0.28599314 \n",
       "       KOTA TASIKMALAYA      KABUPATEN SUMEDANG             KOTA BANJAR \n",
       "            -0.21586076             -0.20800377             -0.11320943 \n",
       "           KOTA BANDUNG KABUPATEN BANDUNG BARAT         KABUPATEN GARUT \n",
       "            -0.07291107              0.11339935              0.13264554 \n",
       "      KABUPATEN BANDUNG      KABUPATEN SUKABUMI         KABUPATEN BOGOR \n",
       "             0.13295958              0.29064658              0.35353242 \n",
       "   KABUPATEN PURWAKARTA             KOTA BEKASI            KOTA CIREBON \n",
       "             0.41507357              0.59896375              0.65171016 \n",
       "             KOTA DEPOK           KOTA SUKABUMI   KABUPATEN TASIKMALAYA \n",
       "             0.70576578              0.71796810              0.75312801 \n",
       "      KABUPATEN CIANJUR              KOTA BOGOR             KOTA CIMAHI \n",
       "             0.80151748              0.89942906              0.96370884 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sort(fixef(gf2))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "d7a78df2",
   "metadata": {
    "papermill": {
     "duration": 0.020992,
     "end_time": "2023-05-14T08:05:09.105451",
     "exception": false,
     "start_time": "2023-05-14T08:05:09.084459",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "> ## Penanganan"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 44,
   "id": "51d26329",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:09.149701Z",
     "iopub.status.busy": "2023-05-14T08:05:09.148444Z",
     "iopub.status.idle": "2023-05-14T08:05:09.186225Z",
     "shell.execute_reply": "2023-05-14T08:05:09.184829Z"
    },
    "papermill": {
     "duration": 0.061746,
     "end_time": "2023-05-14T08:05:09.187982",
     "exception": false,
     "start_time": "2023-05-14T08:05:09.126236",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message in log(TPT):\n",
      "“NaNs produced”\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "\n",
       "\tBreusch-Godfrey/Wooldridge test for serial correlation in panel models\n",
       "\n",
       "data:  log(TPT) ~ Stunting + AHH + PDRB + Miskin + Angkatan_Kerja +  ...\n",
       "chisq = 6.6795, df = 2, p-value = 0.03545\n",
       "alternative hypothesis: serial correlation in idiosyncratic errors\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "\n",
       "\tstudentized Breusch-Pagan test\n",
       "\n",
       "data:  gf2_log\n",
       "BP = 8.8044, df = 8, p-value = 0.3591\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# Membuat model dengan data yang sudah discaling dan ditransformasi\n",
    "# model_lag_log <- plm(log(TPT) ~ lag(log(Stunting)) + lag(log(AHH)) + lag(log(PDRB)) + log(Miskin) + log(Angkatan_Kerja) + log(Penduduk_Bekerja) + log(TPAK) + log(RLS), data = data, model = \"within\", index = c(\"Daerah\", \"Tahun\"))\n",
    "gf2_log <- plm(log(TPT)~Stunting+AHH+PDRB+Miskin+Angkatan_Kerja+Penduduk_Bekerja+TPAK+RLS, data = data2, model = \"within\", index=c(\"Daerah\",\"Tahun\"))\n",
    "pbgtest(gf2_log, order = 2)\n",
    "bptest(gf2_log)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 45,
   "id": "2df40af4",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:09.233767Z",
     "iopub.status.busy": "2023-05-14T08:05:09.232488Z",
     "iopub.status.idle": "2023-05-14T08:05:09.252305Z",
     "shell.execute_reply": "2023-05-14T08:05:09.251134Z"
    },
    "papermill": {
     "duration": 0.044112,
     "end_time": "2023-05-14T08:05:09.253940",
     "exception": false,
     "start_time": "2023-05-14T08:05:09.209828",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Oneway (individual) effect Within Model\n",
       "\n",
       "Call:\n",
       "plm(formula = log(TPT) ~ Stunting + AHH + PDRB + Miskin + Angkatan_Kerja + \n",
       "    Penduduk_Bekerja + TPAK + RLS, data = data2, model = \"within\", \n",
       "    index = c(\"Daerah\", \"Tahun\"))\n",
       "\n",
       "Unbalanced Panel: n = 21, T = 1-6, N = 86\n",
       "\n",
       "Residuals:\n",
       "     Min.   1st Qu.    Median   3rd Qu.      Max. \n",
       "-2.369096 -0.270124  0.098452  0.387347  1.450727 \n",
       "\n",
       "Coefficients:\n",
       "                  Estimate Std. Error t-value  Pr(>|t|)    \n",
       "Stunting          -0.18836    0.10670 -1.7652 0.0828786 .  \n",
       "AHH                2.15963    0.88008  2.4539 0.0172110 *  \n",
       "PDRB              -1.01680    0.98403 -1.0333 0.3058302    \n",
       "Miskin             0.67957    0.38573  1.7618 0.0834657 .  \n",
       "Angkatan_Kerja    12.04069    3.33669  3.6086 0.0006499 ***\n",
       "Penduduk_Bekerja -11.59413    2.98366 -3.8859 0.0002682 ***\n",
       "TPAK              -0.47377    0.22283 -2.1261 0.0378346 *  \n",
       "RLS               -0.34015    1.52763 -0.2227 0.8245900    \n",
       "---\n",
       "Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1\n",
       "\n",
       "Total Sum of Squares:    57.58\n",
       "Residual Sum of Squares: 29.891\n",
       "R-Squared:      0.48088\n",
       "Adj. R-Squared: 0.22587\n",
       "F-statistic: 6.60009 on 8 and 57 DF, p-value: 4.5076e-06"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "summary(gf2_log)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 46,
   "id": "a73cf000",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-05-14T08:05:09.301328Z",
     "iopub.status.busy": "2023-05-14T08:05:09.300103Z",
     "iopub.status.idle": "2023-05-14T08:05:09.317017Z",
     "shell.execute_reply": "2023-05-14T08:05:09.315794Z"
    },
    "papermill": {
     "duration": 0.041497,
     "end_time": "2023-05-14T08:05:09.318612",
     "exception": false,
     "start_time": "2023-05-14T08:05:09.277115",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".dl-inline {width: auto; margin:0; padding: 0}\n",
       ".dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}\n",
       ".dl-inline>dt::after {content: \":\\0020\"; padding-right: .5ex}\n",
       ".dl-inline>dt:not(:first-of-type) {padding-left: .5ex}\n",
       "</style><dl class=dl-inline><dt>KABUPATEN PANGANDARAN</dt><dd>-1.51466233068232</dd><dt>KABUPATEN INDRAMAYU</dt><dd>-0.932347218046934</dd><dt>KABUPATEN KUNINGAN</dt><dd>-0.90705803651431</dd><dt>KABUPATEN CIAMIS</dt><dd>-0.795615223946498</dd><dt>KABUPATEN BEKASI</dt><dd>-0.674938565725947</dd><dt>KABUPATEN KARAWANG</dt><dd>-0.622158158576731</dd><dt>KABUPATEN SUBANG</dt><dd>-0.605347690244656</dd><dt>KABUPATEN MAJALENGKA</dt><dd>-0.5823428253425</dd><dt>KABUPATEN CIREBON</dt><dd>-0.285993138505104</dd><dt>KOTA TASIKMALAYA</dt><dd>-0.215860756437843</dd><dt>KABUPATEN SUMEDANG</dt><dd>-0.20800376996174</dd><dt>KOTA BANJAR</dt><dd>-0.113209429148347</dd><dt>KOTA BANDUNG</dt><dd>-0.0729110697149064</dd><dt>KABUPATEN BANDUNG BARAT</dt><dd>0.113399346610234</dd><dt>KABUPATEN GARUT</dt><dd>0.132645535234278</dd><dt>KABUPATEN BANDUNG</dt><dd>0.132959580657833</dd><dt>KABUPATEN SUKABUMI</dt><dd>0.290646581899753</dd><dt>KABUPATEN BOGOR</dt><dd>0.353532423699566</dd><dt>KABUPATEN PURWAKARTA</dt><dd>0.415073572965511</dd><dt>KOTA BEKASI</dt><dd>0.598963750113394</dd><dt>KOTA CIREBON</dt><dd>0.651710160852298</dd><dt>KOTA DEPOK</dt><dd>0.705765777724882</dd><dt>KOTA SUKABUMI</dt><dd>0.717968095901863</dd><dt>KABUPATEN TASIKMALAYA</dt><dd>0.753128006586565</dd><dt>KABUPATEN CIANJUR</dt><dd>0.801517478066034</dd><dt>KOTA BOGOR</dt><dd>0.899429061725706</dd><dt>KOTA CIMAHI</dt><dd>0.963708840809857</dd></dl>\n"
      ],
      "text/latex": [
       "\\begin{description*}\n",
       "\\item[KABUPATEN PANGANDARAN] -1.51466233068232\n",
       "\\item[KABUPATEN INDRAMAYU] -0.932347218046934\n",
       "\\item[KABUPATEN KUNINGAN] -0.90705803651431\n",
       "\\item[KABUPATEN CIAMIS] -0.795615223946498\n",
       "\\item[KABUPATEN BEKASI] -0.674938565725947\n",
       "\\item[KABUPATEN KARAWANG] -0.622158158576731\n",
       "\\item[KABUPATEN SUBANG] -0.605347690244656\n",
       "\\item[KABUPATEN MAJALENGKA] -0.5823428253425\n",
       "\\item[KABUPATEN CIREBON] -0.285993138505104\n",
       "\\item[KOTA TASIKMALAYA] -0.215860756437843\n",
       "\\item[KABUPATEN SUMEDANG] -0.20800376996174\n",
       "\\item[KOTA BANJAR] -0.113209429148347\n",
       "\\item[KOTA BANDUNG] -0.0729110697149064\n",
       "\\item[KABUPATEN BANDUNG BARAT] 0.113399346610234\n",
       "\\item[KABUPATEN GARUT] 0.132645535234278\n",
       "\\item[KABUPATEN BANDUNG] 0.132959580657833\n",
       "\\item[KABUPATEN SUKABUMI] 0.290646581899753\n",
       "\\item[KABUPATEN BOGOR] 0.353532423699566\n",
       "\\item[KABUPATEN PURWAKARTA] 0.415073572965511\n",
       "\\item[KOTA BEKASI] 0.598963750113394\n",
       "\\item[KOTA CIREBON] 0.651710160852298\n",
       "\\item[KOTA DEPOK] 0.705765777724882\n",
       "\\item[KOTA SUKABUMI] 0.717968095901863\n",
       "\\item[KABUPATEN TASIKMALAYA] 0.753128006586565\n",
       "\\item[KABUPATEN CIANJUR] 0.801517478066034\n",
       "\\item[KOTA BOGOR] 0.899429061725706\n",
       "\\item[KOTA CIMAHI] 0.963708840809857\n",
       "\\end{description*}\n"
      ],
      "text/markdown": [
       "KABUPATEN PANGANDARAN\n",
       ":   -1.51466233068232KABUPATEN INDRAMAYU\n",
       ":   -0.932347218046934KABUPATEN KUNINGAN\n",
       ":   -0.90705803651431KABUPATEN CIAMIS\n",
       ":   -0.795615223946498KABUPATEN BEKASI\n",
       ":   -0.674938565725947KABUPATEN KARAWANG\n",
       ":   -0.622158158576731KABUPATEN SUBANG\n",
       ":   -0.605347690244656KABUPATEN MAJALENGKA\n",
       ":   -0.5823428253425KABUPATEN CIREBON\n",
       ":   -0.285993138505104KOTA TASIKMALAYA\n",
       ":   -0.215860756437843KABUPATEN SUMEDANG\n",
       ":   -0.20800376996174KOTA BANJAR\n",
       ":   -0.113209429148347KOTA BANDUNG\n",
       ":   -0.0729110697149064KABUPATEN BANDUNG BARAT\n",
       ":   0.113399346610234KABUPATEN GARUT\n",
       ":   0.132645535234278KABUPATEN BANDUNG\n",
       ":   0.132959580657833KABUPATEN SUKABUMI\n",
       ":   0.290646581899753KABUPATEN BOGOR\n",
       ":   0.353532423699566KABUPATEN PURWAKARTA\n",
       ":   0.415073572965511KOTA BEKASI\n",
       ":   0.598963750113394KOTA CIREBON\n",
       ":   0.651710160852298KOTA DEPOK\n",
       ":   0.705765777724882KOTA SUKABUMI\n",
       ":   0.717968095901863KABUPATEN TASIKMALAYA\n",
       ":   0.753128006586565KABUPATEN CIANJUR\n",
       ":   0.801517478066034KOTA BOGOR\n",
       ":   0.899429061725706KOTA CIMAHI\n",
       ":   0.963708840809857\n",
       "\n"
      ],
      "text/plain": [
       "  KABUPATEN PANGANDARAN     KABUPATEN INDRAMAYU      KABUPATEN KUNINGAN \n",
       "            -1.51466233             -0.93234722             -0.90705804 \n",
       "       KABUPATEN CIAMIS        KABUPATEN BEKASI      KABUPATEN KARAWANG \n",
       "            -0.79561522             -0.67493857             -0.62215816 \n",
       "       KABUPATEN SUBANG    KABUPATEN MAJALENGKA       KABUPATEN CIREBON \n",
       "            -0.60534769             -0.58234283             -0.28599314 \n",
       "       KOTA TASIKMALAYA      KABUPATEN SUMEDANG             KOTA BANJAR \n",
       "            -0.21586076             -0.20800377             -0.11320943 \n",
       "           KOTA BANDUNG KABUPATEN BANDUNG BARAT         KABUPATEN GARUT \n",
       "            -0.07291107              0.11339935              0.13264554 \n",
       "      KABUPATEN BANDUNG      KABUPATEN SUKABUMI         KABUPATEN BOGOR \n",
       "             0.13295958              0.29064658              0.35353242 \n",
       "   KABUPATEN PURWAKARTA             KOTA BEKASI            KOTA CIREBON \n",
       "             0.41507357              0.59896375              0.65171016 \n",
       "             KOTA DEPOK           KOTA SUKABUMI   KABUPATEN TASIKMALAYA \n",
       "             0.70576578              0.71796810              0.75312801 \n",
       "      KABUPATEN CIANJUR              KOTA BOGOR             KOTA CIMAHI \n",
       "             0.80151748              0.89942906              0.96370884 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "sort(fixef(gf2))"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 13.801821,
   "end_time": "2023-05-14T08:05:09.459550",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-05-14T08:04:55.657729",
   "version": "2.4.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
