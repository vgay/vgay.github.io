
\version "2.22.0"
#(set-global-staff-size 18)
\include "double-mark.ly"
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"I Thought About You"
composer = #"J. Van Heusen and J. Mercer"
meter = #"(Med. Latin Funk)"
kwtempo = #"Medium"
kwstyle = #"Latin Funk"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Bob Berg" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=CKUNZMe6seo"
  arranger = \markup \on-the-fly #played?
    \with-url #url
    \with-color #blue \underline
    \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  meter = \markup { \small  { \tiny \raise #0.4 \note {4} #1"= 80" }}
  tagline = ##f
}


\layout {
  \context {
    \Score
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  c1*8:m7.11 c2:m9 des:7+/c c:7+ bes:7+/c c1*2:1.3-5.9 
  c1.:m7.11 f2:m7/c c1:m7 c:9+
  f:m7 d2:m5-7.11 g:9- c1:m9 c:9+
  f2:m11 b:13sus4 e:6 g:9- c1*2:m11
  as2:6 g:m9 f:m9 es:7+9 c1:m9 
  g2.:5-7 g4:9+13
  c1*4:m7.11
  f2..:m11 b8:sus4 e2.:7+ g4:7 c:m7 bes:m9 as:7+ ges:13 f:7 b:7 as:7 d:7
  g2:m7 as:7+9 d:m5-7.11 g:5+7 c1*2:m7.11
  c2:m9 des:7+/c c:7+ bes:7+/c c1:1.3-5.9 s c2:1.3-5.9 es:9+
  c1.:m11 g2:5-7.9- c1.:m11 r1
}

harmoniesB = \chordmode {
  \set chordChanges = ##f
  c1*4:m7.11 c2:m9 des:7+/c c:7+ bes:7+/c c1*2:1.3-5.9 
  c1.:m7.11 f2:m7/c c1:m7 c:9+
  f:m7 d2:m5-7.11 g:9- c1:m9 c:9+
  f2:m11 b:13sus4 e:6 g:9- c1*2:m11
  as2:6 g:m9 f:m9 es:7+9 c1:m9 
  g2.:5-7 g4:9+13
  c1*4:m7.11
  f2..:m11 b8:sus4 e2.:7+ g4:7 c:m7 bes:m9 as:7+ ges:13 f:7 b:7 as:7 d:7
  g2:m7 as:7+9 d:m5-7.11 g:5+7 c1*2:m7.11
  c2:m9 des:7+/c c:7+ bes:7+/c c1:1.3-5.9 s c2:1.3-5.9 es:9+
  c1.:m11 g2:5-7.9- c1.:m11 r4
}




voltaTillCue= \markup \small  { \text \italic { Till Cue } }
voltaOnCue= \markup \small  { \text \italic { On Cue } }


theNotes =  \relative c''' {
  \clef "treble" \key es \major \time 4/4
  \compressEmptyMeasures
  \override MultiMeasureRest #'expand-limit = #1
  \Intro
  R1*2 _\markup "(bs. & dr.)"
  R1*2 _\markup "(pn. fills)"
  d2 _\markup "(synth, tenor fills till A)" c | b a | g1~ | g |
  <es, bes' d d'>2 <des as' c c'> | <c g' b b'> <bes f' a a'>
  <d es g g'> r2 | R1 \break
  \A \repeat volta 2 {
    r8 es~ \tuplet 3/2 { es g bes } d4~ \tuplet 3/2 { 8 des c } |
    g2.~ 16 es bes as' |
    g8. es16~ 8. 16 2~ |
    1 | \break
    r4 r16 c es g bes8. c16~ 8. as16 |
    g2.~ 16 bes c \acciaccatura ges8 f16~ |
    8. es16 f8. es16 f4. es16 f |
    es1 \break }
  \alternative {
    { 
      r8. es16 c'8 bes16 c bes4~ 8. es,16 | \set Score.repeatCommands = #'((volta #f))
      b'4. ais16 b bes4 as8 es | 
      \tuplet 3/2 { \scoop g8 bes bes } bes2. |
      r2 r8. bes,16 d es g bes |
      d8. es16~ 8 d16 bes~ 4.. a16 |
      d4. es16 d bes4 a8 g16 c |
      
      r c f,8~ 4 \once \override TextScript #'extra-offset = #'( 10 . 0 )  r2 _\markup "(tenor fills------------------)" | 
      R1  |
      R1*4 \break
    }
    {
      \Segno c'4. bes16 c bes4.. es,16 | \set Score.repeatCommands = #'((volta #f))
      b'4. es16 b bes8 es16 bes as8 es'16 as, |
      g4 bes c es |
      f2. r16 es d es |
      c d bes8 \tuplet 3/2 { bes bes bes } bes4 \acciaccatura d,8 es8. 16 |
      es4. c16 es g as g8~ 4 | \Coda
      R1 _\markup "(tenor fills)"
      R1 _\markup "(solo piano start)" \break
    }
  }
  \repeat volta 2 {
    \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \mark \markup \bold { \box B \box "Piano Solo" }
    <es bes' d>2_\markup "(synth.)" <des as' c> |
    <c g' b> <bes f' a> |
    <d es g> r2 }
  \alternative {
    {
      \set Score.repeatCommands = #(list(list 'volta voltaTillCue))
      R1
      \set Score.repeatCommands = #(list '(volta #f) (list 'volta voltaOnCue) 'end-repeat)
    }
    {
      \once \override TextScript #'extra-offset = #'( 10 . 0 )
      r2 _\markup \with-color #red \fontsize #2 \bold "D.S. al Coda" \comp 2 \set Score.repeatCommands = #'((volta #f))
    }
  }
  \break
  \repeat volta 2 {
    \mark \markup { \with-color #red  \musicglyph "scripts.varcoda" " " \bold \box "Tenor Solo"}
    <d es f f'>1_\markup "(synth.)" |
  }
  \alternative {
    {
      \set Score.repeatCommands = #(list(list 'volta voltaTillCue))
      r2 <as des g g'>
      \set Score.repeatCommands = #(list '(volta #f) (list 'volta voltaOnCue) 'end-repeat)
    }
    {
      r2 r8. g''16 f4~ \set Score.repeatCommands = #'((volta #f))
    }
  }
  4.. es16 d8. bes16 f c d8~ \bar "" 4 es16 bes a8
}

Basse =  \relative c {
  \clef "bass" \key es \major \time 4/4
  \showStartRepeatBar \bar "[|:"
  \Intro
  \repeat volta 2 { 
    c8. 16~ 8 g'-. bes8. g16 bes8 c-. |
    c,8. 16~ 8 g'-. bes8. f16 g16 bes c8-. |
    c,8. 16~ 8 g'-. bes8. g16 bes8 c16 g |
    c,8. 16~ 8 g'-. bes8. f16 g16 bes c8-. |
  }
  c,8. 16~ 8 g'-. bes8. g16 bes8 c16 g |
  c,8. 16~ 8 g'-. bes8 16 f g bes c bes |
  c,8. 16~ 8 g'-. bes8. g16 bes8 c16 g |
  c,8. 16~ 8 g'-. bes8 f16 g r bes c8-. | \break
  \repeat volta 2 { \A
                    c,8. 16~ 8 g'-. bes8. g16 bes8 c16 g |
                    c,8. 16~ 8 g'-. bes8 16 f g bes c8-. |
                    c,8. 16~ 8 g'-. bes8. g16 bes8 c16 g |
                    c,8. 16~ 8 g'-. bes8 16 f g c8-. bes16 | \break
                    f8. 16~ 8 c'-. es8 16 c f es8-. f16 | 
                    d,8. 16~ 8 a'16 as g8. 16 g'8 d16 g,
                    c,8. 16~ 8 g'-. bes8. f16 g16 bes c8-. |
                    c,8. 16~ 8 g'-. bes8 16 f g c8-. bes16 | \break
  }
  \alternative {
    {
      f8. 16~ 8 c'16 f,  f'8 es16 c b8 b,16 b' |
      \set Score.repeatCommands = #'((volta #f))
      e,8. 16~ 8 b'16 gis'~ gis gis e8 b16 e,8 b'16 |
      c,8. 16~ 8 g'-. bes8 16 f g bes c bes |
      c,8. 16~ 8 g'-. bes8 f16 g r bes c8-. | \break
      as8. 16~ 16 es' bes' as, g8. 16~ 8 g'16 d |
      f,8. 16~ 8 f'16 c es,8. 16~ 8 g'16 c, |
      c,8. 16~ 8 g'16 f bes8. g16 c bes8-. g16
      g8. 16~ 8 r r des' r16 g, g, g' | \break
      c,8. 16~ 8 g'-. bes8 16 f g bes c bes |
      c,8. 16~ 8 g'-. bes8 f16 g r bes c8-. | 
      c,8. 16~ 8 g'-. bes8 16 f g bes c bes |
      c,8. 16~ 8 g'-. bes8 f16 g r bes c8-. | \break
    }
    {
      \Segno f,8. 16~ 16 c'8-. 16 es8 c16 es f8 b,-. | 
  } }
  e,8. 16~ 16 b'8 16 fis'8 gis g d16 g, |
  c8. 16 bes8. bes'16 as g es as, ges8 ges'16 ges, |
  f8 r16 f'~ f b,8 16 as8 as'16 as, d8 d,16 d' | \break
  g,8. g'16 r8 d16 g, as8-. r16 as as'8 es16 as, |
  d8-. r16 d16 r d,8-. d'16 g,8 16 16 g'8 g,16 c | \Coda
  c,8. 16~ 8 g'-. bes8. g16 bes8 c16 g |
  c,8. 16~ 8 g'16 bes r bes8-. g16 bes8-. c16 g \break
  \repeat volta 2 {
    \override Score.RehearsalMark #'self-alignment-X = #LEFT
    \mark \markup \bold { \box B \box "Piano Solo" }
    c,8. 16~ 8 g'-. bes8. g16 bes8 c16 g |
    c,8. 16~ 8 g'16 bes r bes8-. g16 bes8-. c16 g
    c,8. 16~ 8 g'-. bes8. g16 bes8 c16 g }
  \alternative {
    {
      \set Score.repeatCommands = #(list(list 'volta voltaTillCue))
      c,8. 16~ 8 g'-. bes8. g16 bes8 c16 g
      \set Score.repeatCommands = #(list '(volta #f) (list 'volta voltaOnCue) 'end-repeat)
    }
    {
      \once \override TextScript #'extra-offset = #'( 10 . 0 )
      c,8. _\markup \with-color #red \fontsize #2 \bold "D.S. al Coda" c'16~ c bes g f es8. 16 es'8 es,16 es'
    }
  }
  \break \mark \markup { \with-color #red  \musicglyph "scripts.varcoda" " " \bold \box "Tenor Solo"}
  \repeat volta 2 { c,8. 16~ 8 g'16 bes r bes8-. g16 bes8 c16 g }
    \alternative {
    {
      \set Score.repeatCommands = #(list(list 'volta voltaTillCue))
      c,8. 16~ 8 g'16 bes r bes8-. g16 bes8-. c16 g
      \set Score.repeatCommands = #(list '(volta #f) (list 'volta voltaOnCue) 'end-repeat)
    }
    {
      c,8. 16~ 8 f16 g r bes8-. g16~ g  c g8      
    }
  }
  c2 r 
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { meter = \markup { \small  { \tiny \raise #0.4 \note {4} #1"= 80" } \with-color #red "   partition sur 2 pages"} }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { meter = \markup { \small  { \tiny \raise #0.4 \note {4} #1"= 80" } \with-color #red "   partition sur 2 pages"} }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { meter = \markup { \small  { \tiny \raise #0.4 \note {4} #1"= 80" } \with-color #red "   partition sur 2 pages"} }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bassa4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmoniesB
        }
        \new Staff \with { instrumentName = \CleFa } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \Basse
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
      >> >>
} } }

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
