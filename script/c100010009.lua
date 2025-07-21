-- Masked Hero Dian - Change!!!
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
	e2:SetCategory(CATEGORY_TOGRAVE)
	e2:SetType(EFFECT_TYPE_IGNITION)
	e2:SetRange(LOCATION_MZONE)
	e2:SetCountLimit(1)
	e2:SetTarget(s.actcost)
	e2:SetTarget(s.acttg)
	e2:SetOperation(s.actop)
	c:RegisterEffect(e2)

	local e3=Effect.CreateEffect(c)
	e3:SetDescription(aux.Stringid(id,2))
	e3:SetCategory(CATEGORY_TOHAND)
	e3:SetType(EFFECT_TYPE_IGNITION)
	e3:SetRange(LOCATION_GRAVE)
	e3:SetCost(Cost.SelfBanish)
	e3:SetCountLimit(1,{id,1})
	e3:SetTarget(s.addtg)
	e3:SetOperation(s.addop)
	c:RegisterEffect(e3)
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
function s.sendfilter(c,tp)
	return c:IsSetCard(SET_HERO) and c:IsAbleToGrave()
end
function s.actfilter(c,tp)
	return c:IsCode(21143940) and c:GetActivateEffect() and c:GetActivateEffect():IsActivatable(tp,true,true)
end
function s.actcost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.sendfilter,tp,LOCATION_EXTRA,0,1,nil,tp) end
	local g=Duel.SelectMatchingCard(tp,s.sendfilter,tp,LOCATION_EXTRA,0,1,1,nil,tp)
	if #g>0 then
		Duel.SendtoGrave(g,REASON_EFFECT,tp)
	end
end
function s.acttg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.actfilter,tp,LOCATION_DECK,0,1,nil,tp) end
end
function s.actop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
	local g=Duel.SelectMatchingCard(tp,s.actfilter,tp,LOCATION_DECK,0,1,1,nil,tp)
	if #g > 0 then
		Duel.SendtoGrave(g,REASON_EFFECT,tp)
		local te=g:GetFirst():CheckActivateEffect(false,false,false)
		local cost=te:GetCost()
		if cost then
			cost(e,tp,eg,ep,ev,re,r,rp,1)
		end
		local tg=te:GetTarget()
		if tg then
			tg(e,tp,eg,ep,ev,re,r,rp,1)
		end
		local op=te:GetOperation()
		if op then op(e,tp,eg,ep,ev,re,r,rp) end
	end
end

function s.addfilter(c)
	return (c:IsSetCard(SET_HERO) or c:IsSetCard(SET_FUSION) or c:IsSetCard(SET_CHANGE)) and c:IsAbleToHand()
end
function s.addtg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(s.addfilter,tp,LOCATION_GRAVE,0,1,nil) end
	Duel.SetOperationInfo(0,CATEGORY_TOHAND,nil,1,tp,LOCATION_GRAVE)
end
function s.addop(e,tp,eg,ep,ev,re,r,rp)
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_ATOHAND)
	local g=Duel.SelectMatchingCard(tp,s.addfilter,tp,LOCATION_GRAVE,0,1,1,nil)
	if #g>0 then
		Duel.SendtoHand(g,nil,REASON_EFFECT)
		Duel.ConfirmCards(1-tp,g)
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
end