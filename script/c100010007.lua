-- Masked Hero Koga - Change!!!
local s, id = GetID()
function s.initial_effect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(id,0))
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetProperty(EFFECT_FLAG_UNCOPYABLE)
	e1:SetCode(EFFECT_SPSUMMON_PROC)
	e1:SetRange(LOCATION_HAND)
	e1:SetCountLimit(1,id)
	e1:SetCondition(s.spsmcon)
	e1:SetTarget(s.spsmtg)
	e1:SetOperation(s.spsmop)
	c:RegisterEffect(e1)

	local e2=Effect.CreateEffect(c)
	e2:SetDescription(aux.Stringid(id,1))
	e2:SetCategory(CATEGORY_TOHAND)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCountLimit(1)
	e2:SetCost(s.deckcost)
	e2:SetTarget(s.decktg)
	e2:SetOperation(s.deckop)
	c:RegisterEffect(e2)
end
function s.spsmfilter(c,e,tp)
	return c:IsSetCard(SET_HERO) and c:IsReleasable() and not (c == e:GetHandler())
end
function s.spsmcon(e,tp,eg,ep,ev,re,r,rp,chk)
	if c==nil then return true end
	return Duel.CheckReleaseGroup(c:GetControler(),s.spsmfilter,1,true,1,true,c,c:GetControler(),nil,false,e,tp)
	
end
function s.spsmtg(e,tp,eg,ep,ev,re,r,rp,c)
	local g=Duel.SelectReleaseGroup(tp,s.spsmfilter,1,1,true,true,true,c,nil,nil,false,nil,e,tp)
	if g then
		g:KeepAlive()
		e:SetLabelObject(g)
	return true
	end
	return false
end
function s.spsmop(e,tp,eg,ep,ev,re,r,rp)
	local g=e:GetLabelObject()
	if not g then return end
	Duel.Release(g,REASON_COST)
	g:DeleteGroup()
end
function s.splimit(e,c,sump,sumtype,sumpos,targetp,se)
	return not (c:IsSetCard(SET_ELEMENTAL_HERO) or c:IsSetCard(SET_MASKED_HERO))
end
function s.setfilter(c)
	return (c:IsSetCard(SET_FUSION) or c:IsSetCard(SET_CHANGE)) and c:IsSSetable()
end
function s.deckfilter(c)
	return c:IsSetCard(SET_HERO) and c:IsLevelBelow(7) and c:IsAbleToHand()
end
function s.deckcost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.setfilter,tp,LOCATION_DECK,0,1,nil) end
	local g=Duel.GetMatchingGroup(s.setfilter,tp,LOCATION_DECK,0,nil)
	if #g>0 then
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SET)
		local sg=g:Select(tp,1,1,nil)
		Duel.SSet(tp,sg)
		Duel.ConfirmCards(1-tp,sg)
	end
	e:SetLabel(g:GetFirst():GetCode())
	local e1=Effect.CreateEffect(e:GetHandler())
	e1:SetType(EFFECT_TYPE_FIELD)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetCode(EFFECT_CANNOT_SPECIAL_SUMMON)
	e1:SetReset(RESET_PHASE|PHASE_END)
	e1:SetTargetRange(1,0)
	e1:SetLabelObject(e)
	e1:SetTarget(s.splimit)
	Duel.RegisterEffect(e1,tp)
end
function s.decktg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.deckfilter,tp,LOCATION_DECK,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_DECK)
end
function s.deckop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,s.deckfilter,tp,LOCATION_DECK,0,1,1,nil)
	if #g>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
	end
end