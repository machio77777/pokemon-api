<?php

namespace App\Model\Master;

use App\Model\BaseModel;
use \Exception;

class PokemonsModel extends BaseModel {
    
    /**
     * ポケモン図鑑一覧取得
     * @return ポケモン図鑑一覧
     */
    public function getList()
    {
        $sql = <<< SQL
SELECT 
  zukan_no AS zukanNo,
  sub_no AS subNo,
  name AS name 
FROM 
  POKEMONS 
WHERE 
  delete_flg = 0
ORDER BY zukan_no, sub_no
SQL;
        try {
            return $this->con->execute($sql)->fetchAll('assoc');
        } catch (Exception $e) {
            return false;
        }
    }
    
    /**
     * ポケモン図鑑取得
     * @param  integer $zukanNo 図鑑No
     * @param  integer $subNo   サブNo
     * @return ポケモン図鑑
     */
    public function get($zukanNo, $subNo)
    {
        $sql = <<< SQL
SELECT 
  po.zukan_no AS zukanNo,
  po.sub_no AS subNo,
  po.name AS name, 
  ty1.type_name1 AS type1,
  ty2.type_name1 AS type2,
  p1.quality_name AS quality1,
  p2.quality_name AS quality2,
  p3.quality_name AS dreamQuality,
  po.hp AS hp,
  po.at AS at,
  po.df AS df,
  po.sa AS sa,
  po.sd AS sd,
  po.sp AS sp, 
  po.mega_flg AS megaFlg 
FROM 
  POKEMONS po
INNER JOIN TYPES ty1 ON po.type_id1 = ty1.type_id 
LEFT OUTER JOIN TYPES ty2 ON po.type_id2 = ty2.type_id 
INNER JOIN QUALITIES p1 ON po.quality_id1 = p1.quality_id 
LEFT OUTER JOIN QUALITIES p2 ON po.quality_id2 = p2.quality_id 
LEFT OUTER JOIN QUALITIES p3 ON po.dream_quality_id = p3.quality_id 
WHERE 
    po.zukan_no =:zukanNo
AND po.sub_no =:subNo
AND po.delete_flg = 0 
ORDER BY po.zukan_no, po.sub_no
SQL;
        try {
            $pokemon = $this->con->execute($sql, ['zukanNo' => $zukanNo, 'subNo' => $subNo])->fetchAll('assoc');
            if (count($pokemon) > 0) {
                return $pokemon[0];
            } else {
                return null;
            }
        } catch (Exception $e) {
            return false;
        }
    }
}