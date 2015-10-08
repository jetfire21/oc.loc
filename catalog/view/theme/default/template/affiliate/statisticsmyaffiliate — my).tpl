<?php print_r($affiliates);?>
<?php echo $header; ?>

<div class="lk structure">
<div class="wrapper-1">
  <div class="container">

    <div class="full_name"> 
      <p>Профиль <?php echo $customer_info['firstname'].' '.$customer_info['lastname']; ?></</p>
      <h2>Личный кабинет</h2>
    </div>
    <div class="balans">
      <p>Ваш баланс: <span>1 200 руб</span></p>
      <a href="#">Как заработать?</a> / <a href="#">Куда потратить?</a>
      <a class="karta-out" href="#"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/visa.png" alt="">Вывести на карту</a>
    </div>

    <div class="clr"></div>


<?php 

   //   foreach ($affiliates as $affiliate) {

   //      if($affiliate['level'] == 1) {
   //          $lev1[$affiliate['aff_id']] = $affiliate['aff_id'];
   //          $new[$affiliate['aff_id']][] = $affiliate;
   //      }
   //   }

   //     foreach ($affiliates as $affiliate) {
   //      foreach ($lev1 as $k => $v) {
   //           if( $affiliate['level'] == 2 and $affiliate['parent'] == $v ){
   //              $lev2[$k][] = $affiliate['aff_id'];
   //                $new[$k][] = $affiliate;
   //          }
   //      }
   //   }

     
   //    foreach ($affiliates as $affiliate) {
   //      foreach ($lev2 as $lev1 => $val) {
   //          foreach ($val as $k => $v) {
   //               if($affiliate['level'] == 3 and $affiliate['parent'] == $v ){
   //                  $lev3[$lev1][] = $affiliate['aff_id'];
   //                    $new[$lev1][] = $affiliate;
   //                }
   //          }
   //      }                            
   //   }

   // foreach ($affiliates as $affiliate) {
   //      foreach ($lev3 as $lev1 => $val) {
   //          foreach ($val as $k => $v) {
   //               if($affiliate['level'] == 4 and $affiliate['parent'] == $v ){
   //                  $lev4[$lev1][] = $affiliate['aff_id'];
   //                    $new[$lev1][] = $affiliate;
   //                }
   //          }
   //      }                            
   //   }

   // foreach ($affiliates as $affiliate) {
   //      foreach ($lev4 as $lev1 => $val) {
   //          foreach ($val as $k => $v) {
   //               if($affiliate['level'] == 5 and $affiliate['parent'] == $v ){
   //                  $lev5[$lev1][] = $affiliate['aff_id'];
   //                    $new[$lev1][] = $affiliate;
   //                }
   //          }
   //      }                            
   //   }

   // foreach ($affiliates as $affiliate) {
   //      foreach ($lev5 as $lev1 => $val) {
   //          foreach ($val as $k => $v) {
   //               if($affiliate['level'] == 6 and $affiliate['parent'] == $v ){
   //                  $lev6[$lev1][] = $affiliate['aff_id'];
   //                    $new[$lev1][] = $affiliate;
   //                }
   //          }
   //      }                            
   //   }

   // foreach ($affiliates as $affiliate) {
   //      foreach ($lev6 as $lev1 => $val) {
   //          foreach ($val as $k => $v) {
   //               if($affiliate['level'] == 7 and $affiliate['parent'] == $v ){
   //                  $lev7[$lev1][] = $affiliate['aff_id'];
   //                    $new[$lev1][] = $affiliate;
   //                }
   //          }
   //      }                            
   //   }





                   //    foreach ($affiliates as $affiliate) {
   //      foreach ($lev2 as $lev1 => $val) {
   //          foreach ($val as $k => $v) {
   //               if($affiliate['level'] == 3 and $affiliate['parent'] == $v ){
   //                  $lev3[$lev1][] = $affiliate['aff_id'];
   //                    $new[$lev1][2][$affiliate['parent']][3][] = $affiliate;
   //                    break;
   //                }
   //          }
   //      }                            
   //   }
   //    foreach ($affiliates as $affiliate) {
   //      foreach ($lev2 as $lev1 => $val) {
   //          foreach ($val as $k => $v) {
   //               if($affiliate['level'] == 3 and $affiliate['parent'] == $v ){
   //                  $lev3[$lev1][] = $affiliate['aff_id'];
   //                    $new[$lev1][2][$affiliate['parent']][3][] = $affiliate;
   //                    break;
   //                }
   //          }
   //      }                            
   //   }


//---------------------------4 уровни где то вывел---
   //   foreach ($affiliates as $affiliate) {

   //      if($affiliate['level'] == 1) {
   //          $lev1[$affiliate['aff_id']] = $affiliate['aff_id'];
   //          $new[$affiliate['aff_id']][0] = $affiliate;
   //      }
   //   }

   //     foreach ($affiliates as $affiliate) {
   //      foreach ($lev1 as $k => $v) {
   //           if( $affiliate['level'] == 2 and $affiliate['parent'] == $v ){
   //              $lev2[$k][] = $affiliate['aff_id'];
   //                $new[$k][2][$affiliate['aff_id']][0] = $affiliate;
   //                break;
   //          }
   //      }
   //   }

     
   //    foreach ($affiliates as $affiliate) {
   //      foreach ($lev2 as $lev1 => $val) {
   //          foreach ($val as $k => $v) {
   //               if($affiliate['level'] == 3 and $affiliate['parent'] == $v ){
   //                  $lev3[$lev1][] = $affiliate['aff_id'];
   //                    $new[$lev1][2][$affiliate['parent']][3][] = $affiliate;
   //                    break;
   //                }
   //          }
   //      }                            
   //   }

   // foreach ($affiliates as $affiliate) {
   //      foreach ($lev2 as $key => $arr) {
   //                  foreach ($arr as $k_l2 => $v_l2) { 
   //                          foreach ($lev3 as $lev1 => $val) {
   //                              foreach ($val as $k => $v) {
   //                                   if($affiliate['level'] == 4 and $affiliate['parent'] == $v ){
   //                                      $lev4[$lev1][] = $affiliate['aff_id'];
   //                                        $new[$lev1][2][$v_l2][3][$affiliate['aff_id']][0] = $affiliate;
   //                                        break;
   //                                    }
   //                              }
   //                           }          
   //                  }
   //          }
   // }  

   //  foreach ($affiliates as $affiliate) {
   //      foreach ($lev2 as $key => $arr) {
   //                  foreach ($arr as $k_l2 => $v_l2) { 
   //                          foreach ($lev4 as $lev1 => $val) {
   //                              foreach ($val as $k => $v) {
   //                                   if($affiliate['level'] == 5 and $affiliate['parent'] == $v ){
   //                                        $new[$lev1][2][$v_l2][3][$affiliate['parent']][4][0] = $affiliate;
   //                                        break;
   //                                    }
   //                              }
   //                           }          
   //                  }
   //          }
   // }

   //  foreach ($affiliates as $affiliate) {
   //      foreach ($lev2 as $key => $arr) {
   //                  foreach ($arr as $k_l2 => $v_l2) { 
   //                          foreach ($lev5 as $lev1 => $val) {
   //                              foreach ($val as $k => $v) {
   //                                   if($affiliate['level'] == 6 and $affiliate['parent'] == $v ){
   //                                      $lev6[$lev1][] = $affiliate['aff_id'];
   //                                        $new[$lev1][2][$v_l2][3][$k][4][47][5][0] = $affiliate;
   //                                        break;
   //                                    }
   //                              }
   //                           }          
   //                  }
   //          }
   // }

   //---------------------------4 уровни где то вывел---

     foreach ($affiliates as $affiliate) {

        if($affiliate['level'] == 1) {
            $lev1[$affiliate['aff_id']] = $affiliate['aff_id'];
            $new[$affiliate['aff_id']][] = $affiliate;
        }
     }

       foreach ($affiliates as $affiliate) {
        foreach ($lev1 as $k => $v) {
             if( $affiliate['level'] == 2 and $affiliate['parent'] == $v ){
                $lev2[$k][] = $affiliate['aff_id'];
                  $new[$k][] = $affiliate;
            }
        }
     }

     
      foreach ($affiliates as $affiliate) {
        foreach ($lev2 as $lev1 => $val) {
            foreach ($val as $k => $v) {
                 if($affiliate['level'] == 3 and $affiliate['parent'] == $v ){
                    $lev3[$lev1][] = $affiliate['aff_id'];
                      $new[$lev1][] = $affiliate;
                  }
            }
        }                            
     }

   foreach ($affiliates as $affiliate) {
        foreach ($lev3 as $lev1 => $val) {
            foreach ($val as $k => $v) {
                 if($affiliate['level'] == 4 and $affiliate['parent'] == $v ){
                    $lev4[$lev1][] = $affiliate['aff_id'];
                      $new[$lev1][] = $affiliate;
                  }
            }
        }                            
     }

   foreach ($affiliates as $affiliate) {
        foreach ($lev4 as $lev1 => $val) {
            foreach ($val as $k => $v) {
                 if($affiliate['level'] == 5 and $affiliate['parent'] == $v ){
                    $lev5[$lev1][] = $affiliate['aff_id'];
                      $new[$lev1][] = $affiliate;
                  }
            }
        }                            
     }

   foreach ($affiliates as $affiliate) {
        foreach ($lev5 as $lev1 => $val) {
            foreach ($val as $k => $v) {
                 if($affiliate['level'] == 6 and $affiliate['parent'] == $v ){
                    $lev6[$lev1][] = $affiliate['aff_id'];
                      $new[$lev1][] = $affiliate;
                  }
            }
        }                            
     }

   foreach ($affiliates as $affiliate) {
        foreach ($lev6 as $lev1 => $val) {
            foreach ($val as $k => $v) {
                 if($affiliate['level'] == 7 and $affiliate['parent'] == $v ){
                    $lev7[$lev1][] = $affiliate['aff_id'];
                      $new[$lev1][] = $affiliate;
                  }
            }
        }                            
     }

     // foreach ($new as $id_1 => $item) {
     //    foreach ($item as $k => $v) {

     //        if($v['level'] == 2) {
     //            $lev2_1[$v['aff_id']] = $v['aff_id'];
     //            $new[$id_1][$v['aff_id']][] = $v;
     //        }
     //    }
     // }

 
    echo 'aff---------------------------------';
     // print_r($affiliates); 

    // echo 'lev2---------------------------';
    // print_r($lev2);         

    // echo 'lev3---------------------------';
    // print_r($lev3);
          
    // echo 'lev4---------------------------';
    // print_r($lev4);  

    // echo 'lev5---------------------------';
    // print_r($lev5);
    
    //  echo '-----------------------------new------------';
    //  print_r($new);
    //  print_r($affiliates);

?>


    <div class="lm-cart">

      <?php echo $column_left; ?>
            <div class="cart-product">
                <h3>Структура и регистрации </h3>
                <div class="wrap_table">
                <h4>Моя структура партнеров</h4>


<!--                         <?php foreach ($affiliates as $affiliate) { ?>
                        <tr>
                            <td class="level-<?php echo $affiliate['level'];?>"><?php echo $affiliate['affiliate']; ?></td>
                            <td class="d-reg"><?php echo $affiliate['phone3f']['date_added']; ?></td>
                             <?php if( !empty($affiliate['phone3f']['telephone'])): ?>
                                <td class="t-phone"><?php echo $affiliate['phone3f']['telephone']; ?> </td>
                            <?php else:?>
                                <td class="light-gray">Не указан</td>
                            <?php endif;?>
                            <td> <?php echo $affiliate['level']; ?></td>
                            <td><?php echo $affiliate['count_aff']; ?></td>
                            <td class="bold"><?php echo $affiliate['commission']; ?></td>
                        </tr>   
                         <?php } ?> -->

<!--                         <?php foreach ($new as $k => $affiliate) { ?>
                                    <?php foreach ($affiliate as $k => $affiliate) { ?>
                                    <?php echo $affiliate['affiliate']; ?>
                                     <?php } ?>
                        <?php } ?> -->
                            
<!--                             <?php $i = 0; ?>
                         <?php if (isset($affiliates)) { ?>
                            <?php foreach ($new as $k => $affiliate) { ?>
                                <table class="history table-gray">  
                                   <?php if($i == 0):?>
                                         <tr>                        
                                            <th class="tabl-first">Имя</th>
                                            <th class="d-reg">Дата рег.</th>
                                            <th class="t-phone">Телефон</th>
                                            <th class="lev">Ур.</th>
                                            <th class="ref">Реф.</th>
                                            <th class="cash">Мой доход</th>
                                        </tr>
                                    <?php endif;?>
                                <?php if($i%2 == 0):?> 
                                    <?php if($i != 0 ) :?> <table class="history table-gray">   <?php endif;?>
                                <?php else:?>
                                    <table class="history">  
                                <?php endif;?>
                                <?php foreach ($affiliate as $k => $affiliate) { ?>
                                    <tr>
                                        <td class="tabl-first level-<?php echo $affiliate['level'];?>"><?php echo $affiliate['affiliate']; ?></td>
                                        <td class="d-reg"><?php echo $affiliate['phone3f']['date_added']; ?></td>
                                         <?php if( !empty($affiliate['phone3f']['telephone'])): ?>
                                            <td class="t-phone"><?php echo $affiliate['phone3f']['telephone']; ?> </td>
                                        <?php else:?>
                                            <td class="light-gray">Не указан</td>
                                        <?php endif;?>
                                        <td class="lev"> <?php echo $affiliate['level']; ?></td>
                                        <td class="ref"><?php echo $affiliate['count_aff']; ?></td>
                                        <td class="cash bold"><?php echo $affiliate['commission']; ?></td>
                                    </tr>  
                                  <?php } ?>
                            </table>
                            <?php $i++;?>
                            <?php } ?>

                        <?php } else { ?>
                        <table class="history">
                        <tr>
                            <td class="center" colspan="7"> У вас пока нет партнеров</td>
                        </tr>
                        </table>
                        <?php } ?> -->


                                                    <?php $i = 0; ?>
                         <?php if (isset($affiliates)) { ?>
                            <?php foreach ($affiliates as $affiliate) { ?>
                                <table class="history table-gray">  

                                    <table class="history">  

                                    <tr>
                                        <td class="tabl-first level-<?php echo $affiliate['level'];?>"><?php echo $affiliate['affiliate']; ?></td>
                                        <td class="d-reg"><?php echo $affiliate['phone3f']['date_added']; ?></td>
                                         <?php if( !empty($affiliate['phone3f']['telephone'])): ?>
                                            <td class="t-phone"><?php echo $affiliate['phone3f']['telephone']; ?> </td>
                                        <?php else:?>
                                            <td class="light-gray">Не указан</td>
                                        <?php endif;?>
                                        <td class="lev"> <?php echo $affiliate['level']; ?></td>
                                        <td class="ref"><?php echo $affiliate['count_aff']; ?></td>
                                        <td class="cash bold"><?php echo $affiliate['commission']; ?></td>
                                    </tr>  

                            </table>

                            <?php } ?>

                        <?php } else { ?>
                        <table class="history">
                        <tr>
                            <td class="center" colspan="7"> У вас пока нет партнеров</td>
                        </tr>
                        </table>
                        <?php } ?>


<?php

print_r($affiliates);

 foreach ($affiliates as $affiliate) {

        if($affiliate['level'] == 1) {
            $lev1[$affiliate['aff_id']] = $affiliate['aff_id'];
            $new2[$affiliate['aff_id']][0] = $affiliate;
        }
}

    echo "---lev1-------------------";
    print_r($lev1);  

       foreach ($affiliates as $affiliate) {
            foreach ($lev1 as $k1 => $v1) {

                 if( $affiliate['level'] == 2 and $affiliate['parent'] == $k1 ){

                    $lev2 = $affiliate['aff_id'];
                    $p2_1 = $v1;
                     $new2[$k1][2][$affiliate['aff_id']][0] = $affiliate;
                    }
                      
                      foreach ($affiliates as $affiliate2) {
                        if($affiliate2['level'] == 3 and $affiliate2['parent'] == $lev2 ){

                            $lev3 = $affiliate2['aff_id'];
                            $p3_1 = $v1;
                            $new2[$p2_1][2][$lev2][$lev3][0] = $affiliate2;
                        
                        }
                     }

                        //  foreach ($affiliates as $affiliate3) {
                        //     if($affiliate3['level'] == 4 and $affiliate3['parent'] == $lev3 ){

                        //         $lev4 = $affiliate3['aff_id'];
                        //         $new2[$v1][2][$lev2][$lev3][$lev4][0] = $affiliate3;
                        //     }
                        // }
             
            }

        }


   // echo "---lev2------------------";
   //  print_r($lev2);   
   //     echo "--lev3-------------------";
   //  print_r($lev3); 
   //   echo "------------------------------------strart new2      ";
    // print_r($new2);
     echo "------------------------------------end new2     ";
?>

<?php // print_r($new2);?>
                        <table> 

                <?php foreach ($new2 as $key => $val): ?>
                 <?php foreach ($val as $k1 => $v1): ?>
                    <!-- <tr><td><?php echo $v1['affiliate']; ?></td></tr> -->
                    <?php foreach ($v1 as $k2_1 => $v2_1): ?>
                        <?php foreach ($v2_1 as $k2_2 => $v2_2): ?>
                             <tr><td><?php echo $v2_2['affiliate']; ?></td></tr>
                        <?php endforeach; ?>
                    <?php endforeach; ?>
                 <?php endforeach; ?>
                <?php endforeach; ?>
                        </table>
                    


<!--                          <tr>
                                <td><?php echo $affiliate['level']; ?></td>
                                <td><?php echo $affiliate['affiliate']; ?></td>
                                <td><?php echo $affiliate['count_orders']; ?></td>
                                <td><?php echo $affiliate['count_shopping']; ?></td>
                                <td><?php echo $affiliate['sum_orders']; ?></td>
                                <td><?php echo $affiliate['sum_shopping']; ?></td>
                                <td><?php echo $affiliate['commission']; ?></td>
                             </tr> -->

<!--                     <?php foreach ($affiliates as $affiliate) { ?>
                              <tr>
                                <td><?php echo $affiliate['level']; ?></td>
                                <td><?php echo $affiliate['affiliate']; ?></td>
                                <td><?php echo $affiliate['count_orders']; ?></td>
                                <td><?php echo $affiliate['count_shopping']; ?></td>
                                <td><?php echo $affiliate['sum_orders']; ?></td>
                                <td><?php echo $affiliate['sum_shopping']; ?></td>
                                <td><?php echo $affiliate['commission']; ?></td>
                                <td><?php print_r($affiliate['phone3f']); ?></td>
                             </tr>
                               <?php } ?> -->
                
            </div>
                    <div class="clr"></div>
        </div>
    </div>
</div>

<div class="lk-article-bg">

            <div class="container">
                <h4>От профессионалов продаж</h4>

                  <div class="article">
                     <div class="icon-new"></div>
                     <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/women-kak-pod-akses.jpg" alt="">
                     <div class="a-text">
                        <h2><a href="">Подруге может быть интересно</a></h2>
                        <span>Статья от стилиста с телеканала дождь</span>
                     </div>
                 </div> 

                  <div class="article mini-img">
                     <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/girl-military.jpg" alt="">
                     <div class="a-text">
                         <h2><a href="">Мы продаем то что в тренде - заработайте на этом!</a></h2>                  
                        <span>Рудактор портала DB News</span>
                     </div>     
                 </div> 

                  <div class="article mini-img">
                     <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/girl-remen.jpg" alt="">
                     <div class="a-text">
                        <h2><a href="">10 советов по постингу ссылки</a></h2>                   
                        <span>Рудактор портала DB News</span>
                     </div>
                 </div>
            
            </div>

</div>

<?php echo $footer; ?> 
