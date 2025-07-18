-- Favorite: Change Polymerization
local s,id=GetID()
function s.initial_effect(c)
	--Activate
	local e1=Fusion.CreateSummonEff({handler=c,fusfilter=aux.FilterBoolFunction(Card.IsSetCard,SET_HERO),matfilter=s.matfilter,
									 extrafil=s.fextra,extratg=s.extratg})
	e1:SetCountLimit(1,id)
	c:RegisterEffect(e1)

    local e2 = Effect.CreateEffect(c)
    e2:SetDescription(aux.Stringid(id, 0))
    e2:SetCategory(CATEGORY_TOHAND)
    e2:SetType(EFFECT_TYPE_IGNITION)
    e2:SetRange(LOCATION_GRAVE)
	e2:SetCost(Cost.SelfBanish)
    e2:SetTarget(s.thtg)
    e2:SetOperation(s.thop)
	e2:SetCountLimit(1,{id,1})
    c:RegisterEffect(e2)
end
function s.extratg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetPossibleOperationInfo(0,CATEGORY_TOGRAVE,nil,0,tp,LOCATION_EXTRA)
end
function s.fextra(e,tp,mg,sumtype)
	return Duel.GetMatchingGroup(Fusion.IsMonsterFilter(Card.IsAbleToGrave),tp,LOCATION_EXTRA,0,nil),s.fcheck
end
function s.fcheck(tp,sg,fc,sumtype,tp)
	return sg:IsExists(s.ffilter,1,nil,fc,sumtype,tp)
end
function s.matfilter(c,e,tp,chk)
	return not (c:IsLocation(LOCATION_HAND) or c:IsLocation(LOCATION_MZONE));
end
function s.ffilter(c,fc,sumtype,tp)
	return c:IsSetCard(SET_HERO,fc,sumtype,tp) and (not fc.material or c:IsSummonCode(fc,sumtype,tp,fc.material))
end

function s.thtg(e, tp, eg, ep, ev, re, r, rp, chk)
    if chk == 0 then return Duel.IsExistingMatchingCard(s.th_filter, tp, LOCATION_GRAVE, 0, 1, nil) end
    Duel.SetOperationInfo(0, CATEGORY_TOHAND, nil, 1, tp, LOCATION_GRAVE)
end

function s.th_filter(c)
    return c:IsCode(CARD_POLYMERIZATION) or c:IsCode(21143940) -- Mask Change or Polymerization
end

function s.thop(e, tp, eg, ep, ev, re, r, rp)
    local g = Duel.SelectMatchingCard(tp, s.th_filter, tp, LOCATION_GRAVE, 0, 1, 1, nil)
    if g:GetCount() > 0 then
        Duel.SendtoHand(g, nil, REASON_EFFECT)
        Duel.ConfirmCards(1 - tp, g)
    end
end